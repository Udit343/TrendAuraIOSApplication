
//  ProfilePageTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 31/07/26.


import UIKit

class ProfilePageTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImage : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var subTitleLabel : UILabel!
    @IBOutlet weak var  forwardImage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        selectionStyle = .none
        titleLabel.font = UIFont.Outfit_Medium(size: 13)
        subTitleLabel.font = UIFont.Outfit_Regular(size: 10)
        
        selectionStyle = .none
        
    }
    
    func configure(with Value : profileInfo){
        mainImage.image = UIImage(named: Value.imageTitle)
        titleLabel.text = Value.title
        subTitleLabel.text = Value.subTitle
        forwardImage.image = UIImage(named: "profilemove")
    }
}
