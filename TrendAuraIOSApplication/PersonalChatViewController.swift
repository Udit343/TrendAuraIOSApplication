//
//  PersonalChatViewController.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 14/08/26.
//

import UIKit
import FirebaseFirestore

class PersonalChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var backGroundImageView : UIImageView!
    @IBOutlet weak var bottomBackgroundImage : UIImageView!
    @IBOutlet weak var typingView : UIView!
    @IBOutlet weak var  typingTextField : UITextField!
    @IBOutlet weak var sendButton : UIButton!
    @IBOutlet weak var lineView : UIView!
    
    @IBOutlet weak var topView : UIView!
    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var nameSubLabel : UILabel!
    @IBOutlet weak var optionButton : UIButton!
    @IBOutlet weak var tableView : UITableView!
    
     var currentUserId : String = ""
     var otherUserID : String = ""
    
    private var messages : [ChatMessage] = []
    private var listener : ListenerRegistration?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        typingTextField.borderStyle = .none
        typingView.layer.borderWidth = 1
        typingView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        typingView.layer.cornerRadius = 7 * screenHeightFactor
        
        typingTextField.setPlaceholder(text: "Send Message", color: UIColor.white, font: UIFont.Outfit_Regular(size: 13)
        )
        
        nameLabel.font = UIFont.Outfit_Medium(size: 12.6)
        nameSubLabel.font = UIFont.Outfit_Light(size: 11.4)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        startListening()
    }
    
    func startListening() {
           listener = ChatService.shared.listenForMessages(userA: currentUserId, userB: otherUserID) { [weak self] messages in
               guard let self = self else { return }
               self.messages = messages
               DispatchQueue.main.async {
                   self.tableView.reloadData()
                   self.scrollToBottom()
               }
           }
       }
    
    func scrollToBottom() {
           guard !messages.isEmpty else { return }
           let lastIndex = IndexPath(row: messages.count - 1, section: 0)
           tableView.scrollToRow(at: lastIndex, at: .bottom, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
        
        return messages.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        if indexPath.row % 2 == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalChatSendTableViewCell", for: indexPath) as! PersonalChatSendTableViewCell
//            return cell
//        }else{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalChatAcceptTableViewCell", for: indexPath) as! PersonalChatAcceptTableViewCell
//            return cell
//        }
//        
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let isMine = message.senderdId == currentUserId
        
        print(" currentUserId:", currentUserId)
        print(" otherUserID:", otherUserID)

            if isMine {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalChatSendTableViewCell", for: indexPath) as! PersonalChatSendTableViewCell
                cell.messageLabel.text = message.text
                cell.timeLabel.text = formatTime(message.timestamp)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalChatAcceptTableViewCell", for: indexPath) as! PersonalChatAcceptTableViewCell
                cell.messageLabel.text = message.text
                cell.timeLabel.text = formatTime(message.timestamp)
                return cell
            }
        }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
            guard let text = typingTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else { return }

            ChatService.shared.sendMessage(from: currentUserId, to: otherUserID, text: text)
            typingTextField.text = ""
    }
    
    
    
    func formatTime(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            return formatter.string(from: date)
        }
    
    @IBAction func PreviousPage(_ sender : UIButton){
        listener?.remove()
        navigationController?.popViewController(animated: true)
    }
}
