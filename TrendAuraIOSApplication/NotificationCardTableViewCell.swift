//  NotificationCardTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 12/08/26.

import UIKit

class NotificationCardTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationImage : UIImageView!
    @IBOutlet weak var notificationDescription : UILabel!
    @IBOutlet weak var timeLable : UILabel!
    @IBOutlet weak var symbolImageView : UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        notificationDescription.font = UIFont.Manrope_SemiBold(size: 13)
        timeLable.font = UIFont.Manrope_Regular(size: 10)
        
        selectionStyle = .none
        
    }

    func configure(with notification : NotificationCard){
        notificationImage.image = UIImage(named: notification.profileImage)
        timeLable.text = notification.timeString
        symbolImageView.image = UIImage(named: notification.notificationImage)
        
        let fullText = "\(notification.name) \(notification.description)"
        
        let attributedText = NSMutableAttributedString(string: fullText)
        
        let nameRange = NSRange(location: 0, length: notification.name.count)
        
        let descriptionRange = NSRange(location: notification.name.count + 1, length: notification.description.count)
        
        attributedText.addAttributes([
            .font : UIFont.Manrope_Bold(size: 13),
            .foregroundColor : UIColor.white
        ],range: nameRange)
        
        attributedText.addAttributes([
            .font : UIFont.Manrope_Light(size: 13),
            .foregroundColor : UIColor.white.withAlphaComponent(0.8) ], range: descriptionRange)
        
        notificationDescription.attributedText = attributedText
        
    }

}
