//  HashTagTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 23/07/26.


import UIKit

class HashTagTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var hashTagImageView : UIImageView!
    @IBOutlet weak var hashTagLabel: UILabel!
    @IBOutlet weak var promosLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        hashTagLabel.font = UIFont.Outfit_Medium(size: 15)
        promosLabel.font = UIFont.Outfit_Regular(size: 10)
        
        selectionStyle = .none
    }
    
    func configure(with hashTag : HashTagModel){
        hashTagImageView.image = UIImage(named: "hashTag")
        hashTagLabel.text = hashTag.hashNmae
        promosLabel.text = hashTag.promos
    }
}
