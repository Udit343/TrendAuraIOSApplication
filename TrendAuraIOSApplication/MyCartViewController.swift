//
//  MyCartViewController.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 10/08/26.
//

import UIKit

class MyCartViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var outerBackgroundImage : UIImageView!
    @IBOutlet weak var myCartImageView : UIView!
    @IBOutlet weak var myCartView : UIView!
    @IBOutlet weak var myCartLabel : UILabel!
    @IBOutlet weak var horizontalView : UIView!
    @IBOutlet weak var cardOuterView : UIView!
    @IBOutlet weak var cardImageView : UIImageView!
    @IBOutlet weak var profileImageView : UIImageView!
    @IBOutlet weak var profileLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var hashTag : UILabel!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var subTitleLabel : UILabel!
    @IBOutlet weak var buttonOuterView : UIView!
    @IBOutlet weak var cancelButton : UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    @IBOutlet weak var visitCountView : UIView!
    @IBOutlet weak var visitCountImageView : UIView!
    @IBOutlet weak var visitCountLabel : UILabel!
    @IBOutlet weak var visitCountInnerView : UIView!
    
    @IBOutlet weak var likeOuterView : UIView!
    @IBOutlet weak var  likeImageView : UIView!
    @IBOutlet weak var likeLabel : UILabel!
    @IBOutlet weak var likeInnerView : UIView!
    
    var favouriteReel: FavouriteReelItem?
        var OnRemoveTapped: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myCartLabel.font = UIFont.Outfit_SemiBold(size: 17)
        
        profileLabel.font = UIFont.Outfit_Medium(size: 9)
        descriptionLabel.font = UIFont.Outfit_Medium(size: 10)
        hashTag.font = UIFont.Outfit_Regular(size: 8)
        
        titleLabel.font = UIFont.Outfit_SemiBold(size: 20)
        subTitleLabel.font = UIFont.Outfit_Light(size: 16)
        
        cancelButton.titleLabel?.font = UIFont.Outfit_Medium(size: 15)
        
        
        
        removeButton.titleLabel?.font = UIFont.Outfit_Medium(size: 15)
        
        cardOuterView.layer.cornerRadius = 8 * screenHeightFactor
        
        outerBackgroundImage.layer.cornerRadius = 15  * screenHeightFactor
        outerBackgroundImage.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        
        cardOuterView.layer.borderWidth = 1
        cardOuterView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.3).cgColor
        
        likeOuterView.layer.cornerRadius = 10 * screenHeightFactor
        likeLabel.font = UIFont.Outfit_Bold(size: 7)
        
        visitCountView.layer.cornerRadius = 10 * screenHeightFactor
        visitCountLabel.font = UIFont.Outfit_Bold(size: 7)
        
        cancelButton.layer.cornerRadius = 15 * screenHeightFactor
        cancelButton.clipsToBounds = true
        
        removeButton.layer.cornerRadius = 15 * screenHeightFactor

//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BackGroundTapped))
//        
//        tapGesture.delegate = self
//        view.addGestureRecognizer(tapGesture)
        
        if let favouriteReel = favouriteReel {
               configure(with: favouriteReel)
           }
        cardImageView.layer.cornerRadius = 6 * screenHeightFactor
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cancelButton.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 2,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
        
        removeButton.applyGradientBackground(colors: [
                        UIColor(hex: "FFCC70"),
                        UIColor(hex: "C850C0"),
                        UIColor(hex: "4C57CF"),
                    ],
                    startPoint: CGPoint(x: 1, y: 0),
                    endPoint: CGPoint(x: 0, y: 1)
                    )
    
    }
    
//    @objc func BackGroundTapped(_ sender : UITapGestureRecognizer){
//        
//        view.endEditing(true)
//        dismiss(animated: true)
//    }
    
    func configure(with reel: FavouriteReelItem) {   
        let product = reel.toProductItem()
        cardImageView.loadImage(from: product.productImage, placeholder: UIImage(named: "cardImage"))
        profileImageView.loadImage(from: product.profileImage, placeholder: UIImage(named: "cardProfileImage"))
        profileLabel.text = product.profileName
        titleLabel.text = product.title
        subTitleLabel.text = product.subTitle
        descriptionLabel.text = reel.description
        hashTag.text = reel.tags
        visitCountLabel.text = product.visitCount
        likeLabel.text = product.likeCount
    }

    
    @IBAction func cancel(_ sender : UIButton){
        
        dismiss(animated: true)
        
    }
    
    @IBAction func removeButtonTapped(_ sender : UIButton){
              OnRemoveTapped?()
    }
    
}
