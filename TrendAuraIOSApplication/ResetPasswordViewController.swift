//  ResetPasswordViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 20/08/26.

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var passwordLabel : UILabel!
    @IBOutlet weak var passwordView : UIView!
    @IBOutlet weak var passwordImage : UIView!
    @IBOutlet weak var passwordTextField : UITextField!
    @IBOutlet weak var passwordButton : UIButton!
    @IBOutlet weak var confirmpasswordLabel : UILabel!
    @IBOutlet weak var confirmpasswordView : UIView!
    @IBOutlet weak var confirmpasswordImage : UIView!
    @IBOutlet weak var confirmpasswordTextField : UITextField!
    @IBOutlet weak var confirmpasswordButton : UIButton!
    @IBOutlet weak var resetLabel : UILabel!
    
    @IBOutlet weak var continueButton : UIButton!
    
    var isPasswordVisible  = false
    
    var isConfirmPasswordVisible = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont.Outfit_Medium(size: 19.2)
        passwordLabel.font = UIFont.Outfit_Medium(size: 14.5)
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        passwordView.layer.cornerRadius = 18 * screenHeightFactor
        
        confirmpasswordLabel.font = UIFont.Outfit_Medium(size: 14.5)
        confirmpasswordView.layer.borderWidth = 1
        confirmpasswordView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        confirmpasswordView.layer.cornerRadius = 18 * screenHeightFactor
        
        resetLabel.font = UIFont.Outfit_SemiBold(size: 17)

        passwordTextField.setPlaceholder(text: "At least 8 characters", color: UIColor.white.withAlphaComponent(0.5), font: UIFont.Outfit_Regular(size: 12.5))
        
        confirmpasswordTextField.setPlaceholder(text: "At least 8 characters", color: UIColor.white.withAlphaComponent(0.5), font: UIFont.Outfit_Regular(size: 12.5))
        
        continueButton.titleLabel?.font = UIFont.Outfit_Medium(size: 15.5)
        
        continueButton.layer.cornerRadius = 18 * screenHeightFactor
        
        passwordTextField.borderStyle = .none
        
        passwordTextField.font = UIFont.Outfit_Regular(size: 13)
        
        confirmpasswordTextField.borderStyle = .none
        
        confirmpasswordTextField.font = UIFont.Outfit_Regular(size: 13)
        
        passwordTextField.isSecureTextEntry = true
        confirmpasswordTextField.isSecureTextEntry = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        continueButton.layer.borderWidth = 2
        continueButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        
        
        continueButton.applyGradientBackground(colors:
            [
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
    }
    
    
    @IBAction func contiueButtonTapped(_ sender : UIButton){
              
        guard !passwordTextField.isEmpty() else{
            show_Alert(message: "Fill Password")
            return
        }
        
        guard passwordTextField.isValidPassword() else{
            show_Alert(message: "Fill Valid password")
            return
        }
        
        guard !confirmpasswordTextField.isEmpty() else{
            show_Alert(message: "Fill exact samePassword")
            return
        }
        
        guard confirmpasswordTextField.isValidPassword() else{
            show_Alert(message: "Fill Valid Password")
            return
        }
        
        guard passwordTextField.text == confirmpasswordTextField.text else {
            show_Alert(message: "Fill Exact same Password")
            return
        }
        
        let gotoSuccPage = storyboard?.instantiateViewController(withIdentifier: "ResetPasswordChangedSuccViewController") as! ResetPasswordChangedSuccViewController
        
        navigationController?.pushViewController(gotoSuccPage, animated: true)
        
        
    }
    
    
    @IBAction func backButtonTapped(_ sender : UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func showHidePassword(_ sender : UIButton){
        
        isPasswordVisible.toggle()
        
        passwordTextField.isSecureTextEntry = !isPasswordVisible
        
        let imagePassword = isPasswordVisible ? "hidePassword" : "showPassword"
        
        passwordButton.setImage(UIImage(named: imagePassword), for: .normal)
    }
    
    @IBAction func showHideConfirmPassword(_ sender : UIButton){
        
        isConfirmPasswordVisible.toggle()
        
        confirmpasswordTextField.isSecureTextEntry = !isConfirmPasswordVisible
        
        let imageConfirmPassword = isConfirmPasswordVisible
            ? "hidePassword"
            : "showPassword"
        
        confirmpasswordButton.setImage(UIImage(named: imageConfirmPassword), for: .normal)
    }
}
