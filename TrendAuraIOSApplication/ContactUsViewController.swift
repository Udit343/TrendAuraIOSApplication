//
//  ContactUsViewController.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 12/08/26.
//

import UIKit

class ContactUsViewController: UIViewController {

    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var contactImageView : UIImageView!
    @IBOutlet weak var contactUsLabel : UILabel!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var subTitle : UILabel!
    @IBOutlet weak var mailView : UIView!
    @IBOutlet weak var mailLogoImageView : UIImageView!
    @IBOutlet weak var sendUsLabel : UILabel!
    @IBOutlet weak var contactLabel : UILabel!
    @IBOutlet weak var barView : UIView!
    @IBOutlet weak var forwardImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        contactUsLabel.font = UIFont.Outfit_Medium(size: 21)
        
        titleLabel.font = UIFont.Outfit_SemiBold(size: 25)
        subTitle.font = UIFont.Outfit_Regular(size: 12)
        
        mailView.layer.borderWidth = 1
        mailView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.1).cgColor
        mailView.layer.cornerRadius = 12 * screenHeightFactor
        
        sendUsLabel.font = UIFont.Outfit_Medium(size: 15)
        contactLabel.font = UIFont.Outfit_Regular(size: 11)
        
    }
    
    @IBAction func backPage(_ sender : UIButton){
        
        navigationController?.popViewController(animated: true)
        
    }
}
