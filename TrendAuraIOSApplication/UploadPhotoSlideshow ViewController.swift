//
//  UploadPhotoSlideshow ViewController.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 14/09/26.
//

import UIKit

class UploadPhotoSlideshow_ViewController: UIViewController {

    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var  uploadTitle : UILabel!
    @IBOutlet weak var  freePlanOuterView : UIView!
    @IBOutlet weak var  freePlanInnerView : UIView!
    @IBOutlet weak var  freePlanImageView : UIImageView!
    @IBOutlet weak var  freePlanTitle : UILabel!
    @IBOutlet weak var  lineView : UIView!
    @IBOutlet weak var  uploadImageView : UIImageView!
    @IBOutlet weak var  titleLabel : UILabel!
    @IBOutlet weak var  subTtileLabel : UILabel!
    @IBOutlet weak var  uploadVideoOuterView : UIView!
    @IBOutlet weak var  uploadVideoInnerView : UIView!
    @IBOutlet weak var  uploadVideoImageView : UIImageView!
    @IBOutlet weak var  uploadVideoTtile : UILabel!
    @IBOutlet weak var  uploadButton : UIButton!
    
    @IBOutlet weak var  uploadPhotoOuterView : UIView!
    @IBOutlet weak var  uploadPhotoInnerView : UIView!
    @IBOutlet weak var  uploadPhotoImageView : UIImageView!
    @IBOutlet weak var  uploadPhotoTtile : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadTitle.font = UIFont.Outfit_Medium(size: 14.5)
        freePlanTitle.font = UIFont.Manrope_SemiBold(size: 9)
        titleLabel.font = UIFont.Outfit_SemiBold(size: 18)
        subTtileLabel.font = UIFont.Outfit_Light(size: 13)
        uploadVideoTtile.font = UIFont.Outfit_Regular(size: 11.5)
        uploadPhotoTtile.font = UIFont.Outfit_Regular(size: 11.5)
        
        uploadVideoOuterView.layer.cornerRadius = 13 * screenHeightFactor
        uploadPhotoOuterView.layer.cornerRadius = 17 * screenHeightFactor
        
        freePlanOuterView.layer.cornerRadius = 13 * screenHeightFactor
        
        freePlanOuterView.layer.borderWidth = 2
        freePlanOuterView.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        
        uploadPhotoOuterView.layer.backgroundColor = UIColor.black.withAlphaComponent(0.2).cgColor
        
        uploadVideoOuterView.clipsToBounds = true
        uploadVideoOuterView.layer.masksToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        uploadVideoOuterView.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 1,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
        
//        visitOuterView.applyGradientBorder(
//            colors: [
//                
//                UIColor(hex: "FFCC70"),
//                UIColor(hex: "C850C0"),
//                UIColor(hex: "4C57CF")
//            ],
//            borderWidth: 1.2,
//            startPoint: CGPoint(x: 1, y: 0),
//            endPoint: CGPoint(x: 0, y: 1)
//        )
        
        
        uploadPhotoOuterView.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF"),
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
        
        freePlanOuterView.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF"),
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
    }
    
    @IBAction func uploadButtonTapped(_ sender : UIButton){
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "UploadVideoViewController") as! UploadVideoViewController
        VC.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(VC, animated: true)
        
    }
    
    @IBAction func backScreen(_ sender : UIView){
        navigationController?.popViewController(animated: true)
    }
    
}
