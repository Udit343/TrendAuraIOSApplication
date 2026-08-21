//
//  PersonalChatAcceptTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 14/08/26.
//

import UIKit

class PersonalChatAcceptTableViewCell: UITableViewCell {
    
    @IBOutlet weak var OuterView  : UIView!
    @IBOutlet weak var messageView : UIView!
    @IBOutlet weak var messageLabel : UILabel!
    @IBOutlet weak var timeLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        messageLabel.font = UIFont.Outfit_Regular(size: 14)
        timeLabel.font = UIFont.Outfit_Regular(size: 9)
        
        messageView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        messageView.layer.borderWidth = 1
        
        messageView.layer.cornerRadius = 7 * screenHeightFactor
        messageView.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner,
            .layerMaxXMaxYCorner
        ]
    }
    
}
