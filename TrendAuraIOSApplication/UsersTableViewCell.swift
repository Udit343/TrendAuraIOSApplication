//
//  UsersTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 23/07/26.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var OuterView : UIView!
    @IBOutlet weak var userImageView : UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userSubName : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userNameLabel.font = UIFont.Outfit_Medium(size: 15)
        userSubName.font = UIFont.Outfit_Light(size: 14)
        
        selectionStyle = .none
    }
    
    func configure(with user : userModel){
        userImageView.image = UIImage(named: user.userImage)
        userNameLabel.text = user.userName
        userSubName.text = user.userSubName
    }
}
