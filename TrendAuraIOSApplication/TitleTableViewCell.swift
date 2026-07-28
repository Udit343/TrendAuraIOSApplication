//  TitleTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 21/07/26.


import UIKit

class TitleTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.Outfit_Regular(size: 15)
        selectionStyle = .none
    }

    func configure(with title: String) {
           titleLabel.text = title
       }

}
