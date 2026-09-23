//  FilterSubSectionTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 27/07/26.

import UIKit

class FilterSubSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var subSectionView : UIView!
    @IBOutlet weak var tickButton : UIButton!
    @IBOutlet weak var subSectionLavel : UILabel!
    
    var onToggle: (() -> Void)?
    
  var ischeck = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subSectionLavel.font = UIFont.Outfit_Light(size: 12)
        
        selectionStyle = .none

    }
    
    
    func configure(with subSection : String, isChecked: Bool){
        subSectionLavel.text = subSection
        let image = isChecked ? UIImage(named: "check1") : UIImage(named: "filterUncheck")
        tickButton.setImage(image, for: .normal)
        
    }
    
    @IBAction func checkUnCheck(_ sender : UIButton){
        onToggle?()
//        ischeck.toggle()
//        
//        let image = ischeck ? UIImage(named: "check1") : UIImage(named: "filterUncheck")
//        
//        tickButton.setImage(image, for: .normal)
        
    }
    
}
