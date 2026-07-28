//
//  TrandingCollectionViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 21/07/26.
//

import UIKit

class TrandingCollectionViewCell: UICollectionViewCell {
    
   // @IBOutlet weak var traindingButton : UIButton!
    
    
    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var hotLevel : UILabel!
    
    override func awakeFromNib() {
             super.awakeFromNib()
        
        hotLevel.font = UIFont.Outfit_Medium(size: 11)
//        outerView.layer.borderWidth = 2
//        outerView.layer.borderColor = UIColor.white.cgColor
        outerView.layer.cornerRadius = screenHeightFactor * 14
        
        outerView.heightAnchor.constraint(equalToConstant: screenHeightFactor * 27).isActive = true
        
    }
    
    
    func configure(with item: HotItem) {
        hotLevel.text = item.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        outerView.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 2.5,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
    }
}
