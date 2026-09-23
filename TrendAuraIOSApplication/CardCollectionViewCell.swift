//  CardCollectionViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 21/07/26.

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
    @IBOutlet weak var addToCartHelpherView : UIView!
    
    @IBOutlet weak var addToCartButton : UIButton!
    
    var onAddToCartTapped : (()->Void)?
    
    private var isFavourite = false
    
    var onCartToggle: ((Bool, @escaping (Bool) -> Void) -> Void)?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outerView.layer.cornerRadius = screenHeightFactor * 10
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).cgColor
        
        nameLabel.font = UIFont.Outfit_Medium(size: 9.5)
        
        cardTitleLabel.font = UIFont.Outfit_Medium(size: 10.5)
        
        cardSubTitleLabel.font = UIFont.Outfit_Regular(size: 9.5)
        
        visitView.layer.cornerRadius = screenHeightFactor * 10
       // visitView.layer.borderWidth = 1
       // visitView.layer.borderColor = UIColor.white.cgColor

        visitLabel.font = UIFont.Outfit_Medium(size: 8)
        
        addCartView.layer.cornerRadius = screenHeightFactor * 9
        addCartView.layer.borderWidth = 1
        addCartView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        
        addCartLabel.font = UIFont.Outfit_Medium(size: 8)
        
        visitCountView.layer.cornerRadius = screenHeightFactor * 10
        visitCountLabel.font = UIFont.Outfit_Bold(size: 7)
        
        likeView.layer.cornerRadius = screenHeightFactor * 10
        likeLabel.font = UIFont.Outfit_Bold(size: 7)
        
        cardImageView.layer.cornerRadius = screenHeightFactor * 6
        
        cardProfileImageView.layer.cornerRadius = 12 *  screenHeightFactor
        cardProfileImageView.clipsToBounds = true
        
       
    }
    
    func configure(with item: ProductItem) {

        cardImageView.loadImage(from: item.productImage, placeholder: UIImage(named: "thumbnailImage"))

        cardProfileImageView.loadImage(from: item.profileImage, placeholder: UIImage(named: "cardProfileImage"))

            nameLabel.text = item.profileName

            cardTitleLabel.text = item.title

            cardSubTitleLabel.text = item.subTitle

            visitCountLabel.text = item.visitCount

            likeLabel.text = item.likeCount
        
           likeImage.image = UIImage(named: "like")
        
           visitCountImageView.image = UIImage(named: "Clip")
        
           cartImageView.image = UIImage(named: "cart")
        
           globeImageView.image = UIImage(named: "globe")
        
           self.isFavourite = item.isFavourite
        
           addCartLabel.text = isFavourite ? "Added" : "Add to cart"
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
    
    @IBAction func addToCartTapped(_ sender : UIButton){
        onCartToggle?(isFavourite){[weak self] success in
            guard let self = self, success else { return }
            self.isFavourite.toggle()
            self.addCartLabel.text = self.isFavourite ? "Added" : "Add to cart"
        }
    }
    
    
}


