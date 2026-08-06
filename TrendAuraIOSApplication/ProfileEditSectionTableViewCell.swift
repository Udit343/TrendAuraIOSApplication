//  ProfileEditSectionTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 03/08/26.


import UIKit

class ProfileEditSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.Outfit_Medium(size: 15)
        
        selectionStyle = .none
        
    }
    
    func configure(with section : String){
        titleLabel.text = section
    }
}
