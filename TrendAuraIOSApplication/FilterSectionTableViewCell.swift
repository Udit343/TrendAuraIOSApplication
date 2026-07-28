//  FilterSectionTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 27/07/26.

import UIKit

class FilterSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var sectionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sectionLabel.font = UIFont.Outfit_Medium(size: 13)
        selectionStyle  = .none
        
    }
    
    func configure(with section : String){
        sectionLabel.text = section
    }
}
