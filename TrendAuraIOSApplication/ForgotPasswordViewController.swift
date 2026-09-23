//  ForgotPasswordViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 20/08/26.


import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var emailLabel : UILabel!
    @IBOutlet weak var emailView : UIView!
    @IBOutlet weak var emailImage : UIView!
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var descriptionLabel : UILabel!
    
    @IBOutlet weak var continueButton : UIButton!
    
    let viewModel = ForgotPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont.Outfit_Medium(size: 19.2)
        emailLabel.font = UIFont.Outfit_Medium(size: 14.5)
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        emailView.layer.cornerRadius = 18 * screenHeightFactor
        
        descriptionLabel.font = UIFont.Outfit_Light(size: 13)

        emailTextField.setPlaceholder(text: "Enter email address", color: UIColor.white.withAlphaComponent(0.5), font: UIFont.Outfit_Regular(size: 12.5))
        
        continueButton.titleLabel?.font = UIFont.Outfit_Medium(size: 15.5)
        
        continueButton.layer.cornerRadius = 18 * screenHeightFactor
        
        emailTextField.borderStyle = .none
        
        emailTextField.font = UIFont.Outfit_Regular(size: 13)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        view.addGestureRecognizer(tapGesture)
        
        
        viewModel.onLoadingChnaged = {[weak self] isLoading in
            self?.continueButton.isEnabled = !isLoading
        }
        
        viewModel.onError = {[weak self] message in
            self?.show_Alert(message: message)
        }
        
        viewModel.onOTPSend = {[weak self] in
            guard let self = self else{ return}
            
            let otpPage = storyboard?.instantiateViewController(withIdentifier: "VerifyOTPViewController") as! VerifyOTPViewController
            
            otpPage.viewModel.email = self.viewModel.email
            
            navigationController?.pushViewController(otpPage, animated: true)
        }
        
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
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
    
    @IBAction func continueTapped(_ sender : UIButton){
        
//        guard !emailTextField.isEmpty() else {
//            show_Alert(message: "Please enter your email.")
//            return
//        }
//        
//        guard emailTextField.isValidEmail() else{
//            show_Alert(message: "Please enter a valid email address.")
//            return
//        }
        
        viewModel.email = emailTextField.text ?? ""
        viewModel.sendOTPTapped()
        
        
        
    }
    
    @IBAction func backButtonTapped(_ sender : UIButton){
        navigationController?.popViewController(animated: true)
    }
    
}


