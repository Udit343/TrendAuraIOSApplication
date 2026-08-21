//  SubCriptionCollectionViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 11/08/26.

import UIKit

class SubCriptionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var categoryLabel : UILabel!
    
    private var isSelect : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryLabel.font = UIFont.Outfit_Medium(size: 11)
        
            //outerView.layer.cornerRadius  = 17
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius: CGFloat = 17

            outerView.layer.cornerRadius = radius
            outerView.clipsToBounds = true
        
        outerView.layer.sublayers?.removeAll {
            $0.name == "GradientBorder" ||
            $0.name == "GradientBackground"
        }
        
        if isSelect {
            
            outerView.layer.borderWidth = 1
            
            outerView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).cgColor
            
            outerView.applyGradientBackground(colors: [
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
                startPoint: CGPointMake(1, 0),
                endPoint: CGPointMake(0, 1)
            )
            
        }else{
            
            outerView.layer.borderWidth = 0
                    outerView.layer.borderColor = nil
            outerView.applyGradientBorder(
                colors: [
                    
                    UIColor(hex: "FFCC70"),
                    UIColor(hex: "C850C0"),
                    UIColor(hex: "4C57CF")
                ],
                borderWidth: 2,
                startPoint: CGPoint(x: 1, y: 0),
                endPoint: CGPoint(x: 0, y: 1)
            )
            
            outerView.backgroundColor =
                        UIColor.black.withAlphaComponent(0.2)

            
        }
    }
    
    func category(with Category : String){
        categoryLabel.text = Category
    }
    
    func updateUI(isSelected: Bool) {

        isSelect = isSelected

        setNeedsLayout()
    }
}
