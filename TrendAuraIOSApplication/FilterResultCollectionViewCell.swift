//
//  FilterResultCollectionViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 09/09/26.
//

import UIKit

class FilterResultCollectionViewCell: UICollectionViewCell{

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
    
    @IBOutlet weak var addCardButton : UIButton!
    
    private var isFavourite = false
        var onCartToggle: ((Bool, @escaping (Bool) -> Void) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outerView.layer.cornerRadius = screenHeightFactor * 9.5
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).cgColor
        
        nameLabel.font = UIFont.Outfit_Medium(size: 9)
        
        cardTitleLabel.font = UIFont.Outfit_Medium(size: 9.5)
        
        cardSubTitleLabel.font = UIFont.Outfit_Regular(size: 7.6)
        
        visitView.layer.cornerRadius = screenHeightFactor * 9
//        visitView.layer.borderWidth = 1
//        visitView.layer.borderColor = UIColor.white.cgColor

        visitLabel.font = UIFont.Outfit_Medium(size: 6.8)
        
        addCartView.layer.cornerRadius = screenHeightFactor * 9.3
        addCartView.layer.borderWidth = 1
        addCartView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        
        addCartLabel.font = UIFont.Outfit_Medium(size: 6.8)
        
        visitCountView.layer.cornerRadius = screenHeightFactor * 8.8
        visitCountLabel.font = UIFont.Outfit_Bold(size: 6.5)
        
        likeView.layer.cornerRadius = screenHeightFactor * 8.5
        likeLabel.font = UIFont.Outfit_Bold(size: 6.5)
        
        cardProfileImageView.layer.cornerRadius = 12 * screenHeightFactor
        cardProfileImageView.clipsToBounds = true
        
        cardImageView.layer.cornerRadius = screenHeightFactor * 7
    }
    
    func configure(with item: ProductItem) {

        cardImageView.loadImage(from: item.productImage , placeholder: UIImage(named: "cardImage"))

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
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        visitView.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 1.3,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
        
        visitView.layer.masksToBounds = true
        
        addCartView.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF"),
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
    }
    
    @IBAction func addToCartButtonTapped(_ sender : UIButton){
        onCartToggle?(isFavourite) { [weak self] success in
                    guard let self = self, success else { return }
                    self.isFavourite.toggle()
                    self.addCartLabel.text = self.isFavourite ? "Added" : "Add to cart"
                }
    }
    
}
