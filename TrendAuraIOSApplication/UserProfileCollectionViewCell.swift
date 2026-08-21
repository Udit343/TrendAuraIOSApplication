//  UserProfileCollectionViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 06/08/26.

import UIKit

class UserProfileCollectionViewCell: UICollectionViewCell {
    
        
    @IBOutlet weak var mainOuterView : UIView!
    @IBOutlet weak var cardImage : UIImageView!
    
    @IBOutlet weak var addedView : UIView!
    @IBOutlet weak var addedImage : UIImageView!
    @IBOutlet weak var addedLabel : UILabel!
    
    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var profileLabel : UILabel!
    
    @IBOutlet weak var cardTitle : UILabel!
    @IBOutlet weak var cardSubTitle : UILabel!
    
    @IBOutlet weak var visitOuterView : UIView!
    @IBOutlet weak var visitInnerView : UIView!
    @IBOutlet weak var visitImage : UIImageView!
    @IBOutlet weak var visitLabel : UILabel!
    
    @IBOutlet weak var removeOuterView : UIView!
    @IBOutlet weak var removeInnerView : UIView!
    @IBOutlet weak var removeImage : UIImageView!
    @IBOutlet weak var removeLabel : UILabel!
    @IBOutlet weak var removeButton : UIButton!
    
    
    @IBOutlet weak var likeOuterView : UIView!
    @IBOutlet weak var  likeInnerView : UIView!
    @IBOutlet weak var  likeImgeView : UIView!
    @IBOutlet weak var  likeLabel : UILabel!
    
    @IBOutlet weak var  visitCountOuterView : UIView!
    @IBOutlet weak var  visitCountInnerView : UIView!
    @IBOutlet weak var  visitCountImageView : UIView!
    @IBOutlet weak var  visitCountLabel : UILabel!
    
    var removeCard : (()->Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addedView.layer.cornerRadius = 5 * screenHeightFactor
        visitOuterView.layer.cornerRadius = 17 * screenHeightFactor
        
        removeOuterView.layer.cornerRadius =  10 * screenHeightFactor
        
        removeOuterView.layer.borderWidth = 1
        removeOuterView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        
        addedLabel.font = Outfit_Medium_Fixed(size: 11)
        
        profileLabel.font = UIFont.Outfit_Medium(size: 9)
        
        cardTitle.font = UIFont.Outfit_Medium(size: 9.5)
        cardSubTitle.font = UIFont.Outfit_Medium(size: 8)
        
        visitLabel.font = UIFont.Outfit_Medium(size: 8.5)
        
        removeLabel.font = UIFont.Outfit_Medium(size: 8)
        
        mainOuterView.layer.borderWidth = 1
        mainOuterView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).cgColor
        mainOuterView.layer.cornerRadius = 8
        
        visitCountOuterView.layer.cornerRadius = screenHeightFactor * 8
        visitCountLabel.font = UIFont.Outfit_Bold(size: 6)
        
        
        likeOuterView.layer.cornerRadius = screenHeightFactor * 8.5
        likeLabel.font = UIFont.Outfit_Bold(size: 6)
        
//        visitCountOuterView.clipsToBounds = true
//        visitCountOuterView.layer.masksToBounds = true
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        visitCountOuterView.layer.sublayers?.removeAll {
//                $0.name == "GradientBorder"
//            }
        
        addedView.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 1,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
        
        visitOuterView.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 2,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
        
        removeOuterView.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF"),
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
    }
    
    @IBAction func removeCard(_ sender : UIButton){
        removeCard?()
    }
    
}
