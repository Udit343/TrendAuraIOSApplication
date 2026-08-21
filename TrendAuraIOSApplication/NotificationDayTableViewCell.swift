//
//  NotificationDayTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 12/08/26.
//

import UIKit

class NotificationDayTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.Outfit_Medium(size: 18)
        
        selectionStyle = .none
    }
    
    func configure(_ title : String){
        titleLabel.text = title
    }
    
}
