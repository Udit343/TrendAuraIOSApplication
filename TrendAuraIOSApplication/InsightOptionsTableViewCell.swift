//  InsightOptionsTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 18/08/26.

import UIKit
class InsightOptionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleImageView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var subTitle : UILabel!
    @IBOutlet weak var count : UILabel!
    @IBOutlet weak var outerView : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    
        titleLabel.font  = UIFont.Manrope_SemiBold(size: 13)
        subTitle.font = UIFont.Manrope_Medium(size: 11)
        count.font = UIFont.Manrope_Bold(size: 13)
        
    }
    
    func configure(_ val : InsightOption){
         
        titleImageView.image = UIImage(named: val.imageName)
        titleLabel.text = val.title
        subTitle.text = val.subtitle
        count.text = val.count
    }
}
