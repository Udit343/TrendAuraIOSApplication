//  ResetPasswordChangedSuccViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 20/08/26.

import UIKit

class ResetPasswordChangedSuccViewController: UIViewController {

    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var headerImage : UIImageView!
    @IBOutlet weak var loginButton : UIButton!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var subtitlelabel : UILabel!
    @IBOutlet weak var succSign : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.titleLabel?.font = UIFont.Outfit_Medium(size: 15.5)
        
        loginButton.layer.cornerRadius = 18 * screenHeightFactor
        
        titleLabel.font = UIFont.Outfit_SemiBold(size: 22.5)
        subtitlelabel.font = UIFont.Outfit_Regular(size: 14.3)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        
        
        loginButton.applyGradientBackground(colors:
            [
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
    }
    
    @IBAction func loginButtonTapped(_ sender : UIButton){
        
        let loginPage = storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        
       
        
        navigationController?.pushViewController(loginPage, animated: true)
        
        
    }
    
}
