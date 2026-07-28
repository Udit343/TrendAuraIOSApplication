//  TermAndConditionTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 24/07/26.


import UIKit

class TermAndConditionTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
        var isChecked = false

        var checkBoxChanged: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        descriptionLabel.font = UIFont.Outfit_Regular(size: 10)
        
        selectionStyle = .none
        
    }
    
    func configuration(){
        descriptionLabel.text = "By clicking here, I state that I have read and understood the terms of service of BTYB."
        
        checkBoxButton.setImage(UIImage(named: "Uncheck"), for: .normal)
    }
    
    @IBAction func checkBoxButtonTapped(_ sender: UIButton) {

            isChecked.toggle()

            let image = UIImage(
                named: isChecked ? "Check" : "Uncheck"
            )

            checkBoxButton.setImage(image, for: .normal)

            checkBoxChanged?(isChecked)
        }
}
