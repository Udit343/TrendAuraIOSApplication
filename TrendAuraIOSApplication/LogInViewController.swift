//  LogInViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 20/07/26.


import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotpasswordLabel: UILabel!
    @IBOutlet weak var hideShowButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordImageView: UIImageView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var signInTitle: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hideShowImageView : UIImageView!
    @IBOutlet weak var backGroundImageView: UIImageView!
    
    var isPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont .Outfit_SemiBold(size: 14)
        signInTitle.font = UIFont.Outfit_Bold(size: 34)
        enterEmailLabel.font = UIFont .Outfit_Regular(size: 13)
        emailLabel.font = UIFont.Outfit_Medium(size: 14)
        passwordLabel.font = UIFont .Outfit_Medium(size: 14)
        accountLabel.font = UIFont.Outfit_Medium(size: 13)
        signUpButton.titleLabel?.font = UIFont.Outfit_Medium(size: 13)
        logInButton.titleLabel?.font = UIFont.Manrope_Bold(size: 14)
        emailView.layer.cornerRadius = screenHeightFactor * 17
        passwordView.layer.cornerRadius = screenHeightFactor * 17
        
       forgotpasswordLabel.font = UIFont.Outfit_SemiBold(size: 11)
        
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        
        signInTitle.text = "Sign in to  your\nAccount"
        
       
        
//        for family in UIFont.familyNames.sorted() {
//            print("Family: \(family)")
//            for font in UIFont.fontNames(forFamilyName: family) {
//                print(font)
//            }
//        }
        
//        emailView.layer.borderWidth = 1
//        emailView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        
//        passwordView.layer.borderWidth = 0.6
//        passwordView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        
        emailTextField.setPlaceholder(text: "Enter email address",
                                      color: UIColor(red: 255, green: 255, blue: 255),
                                      font: UIFont.Outfit_Regular(size: 13)
        )
        
        passwordTextField.setPlaceholder(text: "At least 8 characters", color: UIColor(red: 255, green: 255, blue: 255), font: UIFont.Outfit_Regular(size: 13))
        
        passwordTextField.isSecureTextEntry = true
        
        emailView.applyGradientBorder(
                colors: [
                    UIColor(hex: "FBDA61"),
                    UIColor(hex: "FF5ACD")
                ],
            )
        
        passwordView.applyGradientBorder(
            colors: [
                UIColor(hex: "FBDA61"),
                UIColor(hex: "FF5ACD")
            ],
        )
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        logInButton.layer.cornerRadius = screenHeightFactor * 18

        titleLabel.applyGradientText(
            colors: [
                
                UIColor(hex: "FED150"),
                UIColor(hex: "FF116A")
            ]
        )

        logInButton.applyGradientForButton(
            colors: [
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ]
        )
        
        signUpButton.applyGradientTitle(colors: [
            UIColor(hex: "4C57CF"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "FFCC70")
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        
        )
    }
    
    @IBAction func ShowHideButton(_ sender : UIButton){
        
        isPasswordVisible.toggle()

        passwordTextField.isSecureTextEntry = !isPasswordVisible

        let image = isPasswordVisible ?

        UIImage(named: "showPassword") :

        UIImage(named: "hidePassword")

        hideShowImageView.image = image
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {

        
            guard !emailTextField.isEmpty() else {
                show_Alert(message: "Please enter your email.")
                return
            }

            guard emailTextField.isValidEmail() else {
                show_Alert(message: "Please enter a valid email address.")
                return
            }

            guard !passwordTextField.isEmpty() else {
                show_Alert(message: "Please enter your password.")
                return
            }

            guard passwordTextField.isValidPassword() else {
                show_Alert(message: "Password must be at least 8 characters.")
                return
            }
        
//        let  exploreVC = storyboard?.instantiateViewController(withIdentifier: "ExploreViewController") as! ExploreViewController
//        
//        navigationController?.pushViewController(exploreVC, animated: true)
        
        let tabBarVC = storyboard?.instantiateViewController(
            withIdentifier: "TabBarController"
        ) as! TabBarController

        navigationController?.pushViewController(
            tabBarVC,
            animated: true
        )
    }
    
    @IBAction func signUpPage(_ sender : UIButton){
        let  SignUpViewControllerVC = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        navigationController?.pushViewController(SignUpViewControllerVC, animated: true)
    }
    
    @IBAction func forgotPage(_ sender : UIButton){
        
        let forgotPage = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        
        navigationController?.pushViewController(forgotPage, animated: true)
        
    }
    
}
