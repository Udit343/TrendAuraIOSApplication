//
//  ChatTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 14/08/26.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var nameLable : UILabel!
    @IBOutlet weak var descriptioLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var horizontalLineView : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        nameLable.font = UIFont.Outfit_Medium(size: 13)
        descriptioLabel.font = UIFont.Outfit_Regular(size: 10.7)
        dateLabel.font = UIFont.Outfit_Medium(size: 10.7)

    }

//    func configure(with person : ){
//        profileImage.image = UIImage(named: person.imageNmae)
//        nameLable.text = person.name
//        descriptioLabel.text = person.message
//        dateLabel.text = person.date
//    }
    
    func configure(with person: AppUser) {
            if let imageName = person.imageName {
                profileImage.image = UIImage(named: imageName)
            } else {
                profileImage.image = UIImage(named: "chat1") // fallback placeholder in your asset catalog
            }
            nameLable.text = person.name
            descriptioLabel.text = person.lastMessage ?? "Say hi"

            if let timestamp = person.lastMessageTimestamp {
                let formatter = DateFormatter()
                formatter.dateFormat = "h:mm a"
                dateLabel.text = formatter.string(from: timestamp)
            } else {
                dateLabel.text = ""
            }
        }
    
}
