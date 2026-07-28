//  FilterSubSectionTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 27/07/26.

import UIKit

class FilterSubSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var subSectionView : UIView!
    @IBOutlet weak var tickButton : UIButton!
    @IBOutlet weak var subSectionLavel : UILabel!
    
  var   ischeck = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subSectionLavel.font = UIFont.Outfit_Light(size: 12)
        
        selectionStyle = .none
    }
    
    
    func configure(with subSection : String){
        subSectionLavel.text = subSection
        tickButton.setImage(UIImage(named: "filterCheck"), for: .normal)
    }
    
    @IBAction func checkUnCheck(_ sender : UIButton){
        ischeck.toggle()
        
        let image = ischeck ? UIImage(named: "filterUncheck") : UIImage(named: "filterCheck")
        
        tickButton.setImage(image, for: .normal)
        
    }
    
}
