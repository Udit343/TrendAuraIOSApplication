//
//  ProfileEditAddLinkTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 03/08/26.
//

import UIKit

class ProfileEditAddLinkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var viewImage : UIImageView!
    @IBOutlet weak var viewLabel : UILabel!
    @IBOutlet weak var actionButton : UIButton!
    
    var didTapAddField : (()->Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        outerView.layer.cornerRadius = screenHeightFactor * 15
        outerView.layer.borderWidth  = 2
        outerView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor

        viewLabel.font = UIFont.Outfit_Medium(size: 14)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        outerView.applyGradientBackground(
            colors: [
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
    }
    
    @IBAction func addAdditionalLink(_ sender : UIButton){
        
        //print("button tapped")
        
        didTapAddField?()
        
    }
    
}
