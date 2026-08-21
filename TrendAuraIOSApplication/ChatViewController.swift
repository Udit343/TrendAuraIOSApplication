
//  ChatViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 14/08/26.

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var backgrounImage : UIImageView!
    @IBOutlet weak var messageLabel : UILabel!
    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var searchTextField : UITextField!
    @IBOutlet weak var searchImageView : UIImageView!
    
    @IBOutlet weak var tableView : UITableView!
    
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatPeoplesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        
        cell.configure(with: chatPeoplesData[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70 * screenHeightFactor
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let personalProfilePage = storyboard?.instantiateViewController(withIdentifier: "PersonalChatViewController") as! PersonalChatViewController
        
        navigationController?.pushViewController(personalProfilePage, animated: true)
        
    }
}
