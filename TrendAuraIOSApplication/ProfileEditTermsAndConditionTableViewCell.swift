//  ProfileEditTermsAndConditionTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 04/08/26.

import UIKit

class ProfileEditTermsAndConditionTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var checkButton : UIButton!
    @IBOutlet weak var conditionLabel : UILabel!
    
    
    var didChangedTerms : ((Bool)-> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        conditionLabel.font = UIFont.Outfit_Medium(size: 11)
        conditionLabel.text = "By clicking here, I agree to pay the click-through rate for visit links based on subscription plan."
    }
    
   @IBAction func checkButton(_ sender : UIButton){
       
       sender.isSelected.toggle()

       didChangedTerms?(sender.isSelected)

       if sender.isSelected {

           checkButton.setImage(
               UIImage(named: "check1"),
               for: .normal
           )

       } else {

           checkButton.setImage(
               UIImage(named: "Uncheck"),
               for: .normal
           )
       }
    }
    
}
