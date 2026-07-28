//
//  CardCollectionViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 21/07/26.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var cardImageView : UIImageView!
    @IBOutlet weak var cardProfileImageView: UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var cardTitleLabel : UILabel!
    @IBOutlet weak var cardSubTitleLabel: UILabel!
    @IBOutlet weak var visitView: UIView!
    @IBOutlet weak var globeImageView: UIImageView!
    @IBOutlet weak var visitLabel: UILabel!
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var addCartLabel: UILabel!
    @IBOutlet weak var addCartView : UIView!
    @IBOutlet weak var visitCountView: UIView!
    @IBOutlet weak var visitCountImageView: UIImageView!
    @IBOutlet weak var visitCountLabel: UILabel!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var likeImage : UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outerView.layer.cornerRadius = 15
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).cgColor
        
        nameLabel.font = UIFont.Outfit_Medium(size: 11)
        
        cardTitleLabel.font = UIFont.Outfit_Medium(size: 12)
        
        cardSubTitleLabel.font = UIFont.Outfit_Regular(size: 10)
        
        visitView.layer.cornerRadius = screenHeightFactor * 10
       // visitView.layer.borderWidth = 1
       // visitView.layer.borderColor = UIColor.white.cgColor

        visitLabel.font = UIFont.Outfit_Medium(size: 10)
        
        addCartView.layer.cornerRadius = screenHeightFactor * 9
        addCartView.layer.borderWidth = 1
        addCartView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        
        addCartLabel.font = UIFont.Outfit_Medium(size: 10)
        
        visitCountView.layer.cornerRadius = screenHeightFactor * 10
        visitCountLabel.font = UIFont.Outfit_Bold(size: 9)
        
        likeView.layer.cornerRadius = screenHeightFactor * 10
        likeLabel.font = UIFont.Outfit_Bold(size: 9)
    }
    
    func configure(with item: ProductItem) {

            cardImageView.image = UIImage(named: item.productImage)

            cardProfileImageView.image = UIImage(named: item.profileImage)

            nameLabel.text = item.profileName

            cardTitleLabel.text = item.title

            cardSubTitleLabel.text = item.subTitle

            visitCountLabel.text = item.visitCount

            likeLabel.text = item.likeCount
        
           likeImage.image = UIImage(named: "like")
        
           visitCountImageView.image = UIImage(named: "Clip")
        
           cartImageView.image = UIImage(named: "cart")
        
           globeImageView.image = UIImage(named: "globe")
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        visitView.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 2,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
        addCartView.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF"),
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
    }
}


