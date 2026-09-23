
//  ChatViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 14/08/26.

import UIKit
import FirebaseAuth
import FirebaseFirestore


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var backgrounImage : UIImageView!
    @IBOutlet weak var messageLabel : UILabel!
    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var searchTextField : UITextField!
    @IBOutlet weak var searchImageView : UIImageView!
    
    @IBOutlet weak var tableView : UITableView!
    
    private var users: [AppUser] = []
    private let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.borderStyle = .none
        searchView.layer.borderWidth = 1
        searchView.layer.cornerRadius = 16.2 * screenHeightFactor
        searchView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        
        searchTextField.setPlaceholder(text: "Search", color: UIColor.white, font: UIFont.Outfit_Light(size: 13))
        
        messageLabel.font = UIFont.Outfit_Medium(size: 23)
        
        
        tableView.delegate  = self
        tableView.dataSource = self
        
        fetchUsers()
    }
    
    private func fetchUsers() {
        guard let myUid = KeychainHelpher.shared.getUserId() else {
            print("No userId in Keychain")
            return
        }
        let myUidString = String(myUid)

        db.collection("users").addSnapshotListener { [weak self] snapshot, error in
            guard let self = self, let docs = snapshot?.documents else {
                print(" Fetch users error:", error?.localizedDescription ?? "unknown")
                return
            }
            print(" Got \(docs.count) user docs")

            self.users = docs.compactMap { try? $0.data(as: AppUser.self) }
                .filter { $0.uid != myUidString }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
            
            cell.configure(with: users[indexPath.row])
            
            return cell
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return 70 * screenHeightFactor
            
        }
    
            
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            guard let myUid = KeychainHelpher.shared.getUserId() else {
                        print(" No logged in user")
                        return
                    }
            
            let selectedUser = users[indexPath.row]
                    guard let otherUid = selectedUser.id else { return }
            
            let personalProfilePage = storyboard?.instantiateViewController(withIdentifier: "PersonalChatViewController") as! PersonalChatViewController
            
            personalProfilePage.currentUserId = String(myUid)
                personalProfilePage.otherUserID = otherUid
            
            navigationController?.pushViewController(personalProfilePage, animated: true)
            
        }
    }
    
