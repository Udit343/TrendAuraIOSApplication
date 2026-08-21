//
//  PersonalChatViewController.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 14/08/26.
//

import UIKit

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
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalChatSendTableViewCell", for: indexPath) as! PersonalChatSendTableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalChatAcceptTableViewCell", for: indexPath) as! PersonalChatAcceptTableViewCell
            return cell
        }
        
    }
    
    @IBAction func PreviousPage(_ sender : UIButton){
        navigationController?.popViewController(animated: true)
    }
}
