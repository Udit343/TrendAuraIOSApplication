//
//  UserProfileViewController.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 05/08/26.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var backgroundImageView : UIImageView!
    @IBOutlet weak var  backgroundHeaderView : UIImageView!
    @IBOutlet weak var  bellButton : UIButton!
    @IBOutlet weak var  settingButton : UIButton!
    @IBOutlet weak var  mediaStackView : UIStackView!
    @IBOutlet weak var  nameView : UIView!
    @IBOutlet weak var  nameLabel : UILabel!
    @IBOutlet weak var  nameImage : UIImageView!
    @IBOutlet weak var  subNameLabel : UILabel!
    @IBOutlet weak var  titleView : UIView!
    @IBOutlet weak var  likesView : UIView!
    @IBOutlet weak var  likesCountLabel : UILabel!
    @IBOutlet weak var  likeLabel : UILabel!
    @IBOutlet weak var  cartView : UIView!
    @IBOutlet weak var  cartCount : UILabel!
    @IBOutlet weak var  cartLabel : UILabel!
    @IBOutlet weak var  followerView : UIView!
    @IBOutlet weak var  followersCount : UILabel!
    @IBOutlet weak var  FollowLabel : UILabel!
    @IBOutlet weak var  followingView : UIView!
    @IBOutlet weak var  followingCount : UILabel!
    @IBOutlet weak var  followingLabel : UILabel!
    @IBOutlet weak var  descriptionLabel : UILabel!
    @IBOutlet weak var  mycartOuterView : UIView!
    @IBOutlet weak var  mycartInnerView : UIView!
    @IBOutlet weak var  mycartLabel : UILabel!
    @IBOutlet weak var  mycartImage : UIImageView!
    @IBOutlet weak var  myStoreOuterView : UIView!
    @IBOutlet weak var  myStoteInnerView : UIView!
    @IBOutlet weak var  myStoreImageView : UIImageView!
    @IBOutlet weak var  myStoreLabel : UILabel!
    @IBOutlet weak var  verticalLine1 : UIView!
    @IBOutlet weak var verticalLine2 : UIView!
    @IBOutlet weak var  verticalLine3 : UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myStoreOuterView.layer.cornerRadius = screenHeightFactor * 20
        mycartOuterView.layer.borderWidth = 1
        mycartOuterView.layer.borderColor = UIColor.white.cgColor
        mycartOuterView.layer.cornerRadius = screenHeightFactor * 15
        
        nameLabel.font = UIFont.Outfit_SemiBold(size: 22)
        subNameLabel.font = UIFont.Outfit_Medium(size: 14)
        
        likesCountLabel.font = UIFont.Manrope_Bold(size: 14)
        likeLabel.font = UIFont.Manrope_Bold(size: 10)
        
        cartCount.font = UIFont.Manrope_Bold(size: 14)
        cartLabel.font =  UIFont.Manrope_Bold(size: 10)
        
        followersCount.font = UIFont.Manrope_Bold(size: 14)
        FollowLabel.font =  UIFont.Manrope_Bold(size: 10)
        
        followingCount.font = UIFont.Manrope_Bold(size: 14)
        followingLabel.font =  UIFont.Manrope_Bold(size: 10)
        
        descriptionLabel.font = UIFont.Outfit_Light(size: 11)
        
        mycartLabel.font = UIFont.Outfit_Medium(size: 12)
        
        myStoreLabel.font = UIFont.Outfit_Medium(size: 12)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myStoreOuterView.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 2,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
        
        mycartOuterView.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF"),
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
        
    }
}
