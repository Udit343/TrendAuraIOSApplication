//
//  VerifyOTPViewController.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 20/08/26.
//

import UIKit

class VerifyOTPViewController: UIViewController {

    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var otpLabel : UILabel!
    @IBOutlet weak var otpView : UIView!
    @IBOutlet weak var otpTextField : UITextField!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var ruleLabel : UILabel!
    
    @IBOutlet weak var submitButton : UIButton!
    @IBOutlet weak var dontgetCodeLabel : UILabel!
    @IBOutlet weak var resendButton : UIButton!
    
    let viewModel = ForgotResetOTPViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont.Outfit_Medium(size: 19.2)
        otpLabel.font = UIFont.Outfit_Medium(size: 14.5)
        otpView.layer.borderWidth = 1
        otpView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        otpView.layer.cornerRadius = 18 * screenHeightFactor
        ruleLabel.font = UIFont.Outfit_Light(size: 12.5)

        otpTextField.setPlaceholder(text: "Enter otp", color: UIColor.white.withAlphaComponent(0.5), font: UIFont.Outfit_Regular(size: 12.5))
        
        submitButton.titleLabel?.font = UIFont.Outfit_Medium(size: 15.5)
        
        submitButton.layer.cornerRadius = 18 * screenHeightFactor
        
        otpTextField.borderStyle = .none
        
        otpTextField.font = UIFont.Outfit_Regular(size: 14)
        
        dontgetCodeLabel.font = UIFont.Outfit_Medium(size: 12.5)
        resendButton.titleLabel?.font = UIFont.Outfit_Medium(size: 12.5)
        
        
        let email = viewModel.email
        let describe = "We’ve sent you a six digit code to your registered email address"
        let fullText = "\(describe) \(email)"
        
        let attributedText = NSMutableAttributedString(string: fullText)
        
        let descibeRange = NSRange(location: 0, length: describe.count)
        
        let emailrange = NSRange(location: describe.count + 1, length: email.count)
        
        attributedText.addAttributes([
            .font : UIFont.Outfit_Light(size: 11),
            .foregroundColor : UIColor.white
        ], range: descibeRange)
        
        attributedText.addAttributes([
            .font : UIFont.Outfit_SemiBold(size: 11),
            .foregroundColor : UIColor.white
        ], range: emailrange)
        
        descriptionLabel.attributedText = attributedText
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)
        )
        
        view.addGestureRecognizer(tapGesture)
        
        viewModel.onLoadingChanged = {[weak self] isLoading in
            self?.submitButton.isEnabled = !isLoading
        }
        
        viewModel.onError = {[weak self] message in
            self?.show_Alert(message: message)
        }
        
        viewModel.onOTPVerified = {[weak self] in
            guard let self = self else {return}
            
            let gotoResetPage = storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
            
            navigationController?.pushViewController(gotoResetPage, animated: true)
            
        }
        
    }
    
    @objc private func hideKeyboard(){
        view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        submitButton.layer.borderWidth = 2
        submitButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        
        
        submitButton.applyGradientBackground(colors:
            [
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
    }
    
    @IBAction func submitButtonTapped(_ sender : UIButton){
              
//        guard !otpTextField.isEmpty() else{
//            show_Alert(message: "Fill OTP")
//            return
//        }
//        
//        guard otpTextField.isValidPassword() else{
//            show_Alert(message: "Enter correct otp")
//            return
//        }
        
        let otp = otpTextField.text
        
        viewModel.ContinueTapped(otp: otp!)
        
       
    }
    
    
    @IBAction func backButtonTapped(_ sender : UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resend(_ sender : UIButton){
        viewModel.resendTapped()
    }
}
