
//  CategoryCollectionViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 23/07/26.


import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var categoryLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //        outerView.layer.borderWidth = 1
        //        outerView.layer.borderColor = UIColor.white.cgColor
        
        outerView.layer.cornerRadius = screenHeightFactor * 10
        
        categoryLabel.font = UIFont.Outfit_Regular(size: 14)
        
        updateUI(isSelected: false)
    }
    
    func configuration(with categoryName : String){
        
        categoryLabel.text = categoryName
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
    }
    
    func updateUI(isSelected: Bool) {
        
        if isSelected {
            
            //outerView.backgroundColor = UIColor.clear
            
            //                outerView.applyGradientBorder(
            //                    colors: [
            //
            //                        UIColor(hex: "FFCC70"),
            //                        UIColor(hex: "C850C0"),
            //                        UIColor(hex: "4C57CF")
            //                    ],
            //                    borderWidth: 2,
            //                    startPoint: CGPoint(x: 1, y: 0),
            //                    endPoint: CGPoint(x: 0, y: 1)
            //                )
            
        } else {
            
            //                outerView.layer.sublayers?.removeAll {
            //                    $0.name == "GradientBorder"
            //                }
            //
            //                outerView.layer.borderWidth = 0
            //                outerView.layer.borderColor = UIColor.clear.cgColor
            //                outerView.backgroundColor = .clear
            //
            //                categoryLabel.textColor = .white
            //            }
        }
        
    }
}
