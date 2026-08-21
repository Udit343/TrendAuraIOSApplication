 //  SubCriptionTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 11/08/26.

import UIKit

class SubCriptionTableViewCell: UITableViewCell {

    @IBOutlet  weak var paymentHistory : UIImageView!
    @IBOutlet  weak var titleLabel : UILabel!
    @IBOutlet  weak var dateLabel : UILabel!
    @IBOutlet  weak var amountLabel : UILabel!
    @IBOutlet  weak var lineView : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        titleLabel.font = UIFont.Outfit_Medium(size: 13)
        dateLabel.font = UIFont.Outfit_Regular(size: 11)
        amountLabel.font  = UIFont.Outfit_Medium(size: 13)

    }
    
    func paymentHistory(with history : History){
        paymentHistory.image = UIImage(named: history.imageName)
        titleLabel.text = history.title
        dateLabel.text = history.date
        amountLabel.text = history.amount
    }
}
