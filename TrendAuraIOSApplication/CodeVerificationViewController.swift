//
//  CodeVerificationViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 21/07/26.


import UIKit

class CodeVerificationViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
//    @IBOutlet weak var resendLabel: UILabel!
//    @IBOutlet weak var fourthTextField: UITextField!
//    @IBOutlet weak var thirdTextField: UITextField!
//    @IBOutlet weak var secondTextField: UITextField!
//    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var textFieldContainer: UIStackView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topLineView: UIView!
    @IBOutlet  var otpTextFields: [UITextField]!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    let viewModel = CodeVerificationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont.Outfit_SemiBold(size: 23)
        subTitleLabel.font = UIFont.Outfit_Light(size: 15)
        resendButton.titleLabel?.font = UIFont.Manrope_Bold(size: 11)
        continueButton.titleLabel?.font = UIFont.Outfit_Bold(size: 13)
        topLineView.layer.cornerRadius = 3
            
        setupOTPFields()
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(backgroundTapped)
        )
        
        
        view.addGestureRecognizer(tapGesture)
        
        tapGesture.cancelsTouchesInView = false
        
        navigationController?.navigationBar.isHidden = true
        
        
        viewModel.onError = {[weak self] message in
            self?.show_Alert(message: message)
        }
        
        viewModel.onLoadingChnaged = {[weak self] isLoading in
            self?.continueButton.isEnabled = !isLoading
        }
        
        
        viewModel.onSignUpSuccess = {[weak self] in
        
            guard let self = self else {return}
            let tabBarVC = storyboard?.instantiateViewController(identifier: "TabBarController") as! TabBarController
            navigationController?.pushViewController(tabBarVC, animated: true)
        }
        
        subTitleLabel.text = "We’ve sent you a four digit code to  info@agicent.com"
    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        
        continueButton.layer.cornerRadius = screenHeightFactor * 17
        
        resendButton.applyGradientTitle(colors: [
            UIColor(hex: "FBDA61"),
            UIColor(hex: "FF5ACD")
        ],
        startPoint: CGPoint(x: 0, y: 0.5),
        endPoint: CGPoint(x: 1, y: 0.5)
        )
        
        bottomView.applyGradientBackground(colors: [
            UIColor(hex: "FBDA61"),
            UIColor(hex: "FF5ACD")
        ],
        startPoint: CGPoint(x: 0, y: 0.5),
        endPoint: CGPoint(x: 1, y: 0.5)
        )
        
        continueButton.titleLabel?.font = UIFont.Outfit_Bold(size: 16)
        continueButton.applyGradientForButton(colors: [
            UIColor(hex: "FBDA61"),
            UIColor(hex: "FF5ACD")],
            startPoint: CGPoint(x: 0, y: 0.5),
            endPoint: CGPoint(x: 1, y: 0.5)
        )
    }
    
    func setupOTPFields() {

        for (index,textField) in otpTextFields.enumerated() {

            textField.delegate = self

            textField.keyboardType = .numberPad

            textField.borderStyle = .none

            textField.text = "-"

            textField.tag = index

            textField.layer.cornerRadius = screenHeightFactor * 8

            textField.layer.borderWidth = 1

            textField.layer.borderColor =
            UIColor.white.withAlphaComponent(0.2).cgColor
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        otpTextFields.first?.becomeFirstResponder()
    }
    
    func verifyOTP() {

        let otp = otpTextFields
            .map { $0.text ?? "" }
            .joined()

//        print("OTP =", otp)
//        print("Count =", otp.count)
        
        guard !otp.contains("-"),
              otp.count == otpTextFields.count else {

            show_Alert(
                message: "Please enter complete verification code."
            )
            return
        }
        
        guard let otpNumber = Int(otp) else {
             show_Alert(message: "Invalid OTP")
             return
        }
        
        viewModel.continueTapped(otp: otpNumber)

        

//        let exploreVC = storyboard?.instantiateViewController(withIdentifier: "ExploreViewController") as! ExploreViewController
//
//        print(navigationController)
//
//        navigationController?.pushViewController(exploreVC, animated: true)
        
//        let tabBarVC = storyboard?.instantiateViewController(
//        withIdentifier: "TabBarController"
//    ) as! TabBarController
//        
//        print(navigationController)
//
//    navigationController?.pushViewController(
//        tabBarVC,
//        animated: true
//    )
        
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        
       // print("Button tapped")

        verifyOTP()
    }
    
    
    @IBAction func resendButtonTapped(_ sender : UIButton){
        viewModel.resendTapped()
    }
    
    override func touchesBegan(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {

        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    
    @objc func backgroundTapped(_ sender : UITapGestureRecognizer){
        
        view.endEditing(true)

        
        let location  = sender.location(in: view)
        if !backgroundImageView.frame.contains(location){
            dismiss(animated: true)
        }
    }
}


extension CodeVerificationViewController : UITextFieldDelegate {

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {

    

        if string.isEmpty {
            textField.text = "-"

            if textField.tag > 0 {
                otpTextFields[textField.tag-1].becomeFirstResponder()
            }

            return false
        }

        guard string.count == 1,
              string.first!.isNumber else {
            return false
        }

        textField.text = string

        if textField.tag < otpTextFields.count-1 {
            otpTextFields[textField.tag+1].becomeFirstResponder()

        } else {
            textField.resignFirstResponder()

          //  verifyOTP()
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        textField.text = ""

        textField.applyGradientBorder(
            colors: [

                UIColor(hex: "FBDA61"),
                UIColor(hex: "FF5ACD")
            ]
        )
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        if textField.text?.isEmpty == true {

            textField.text = "-"

            textField.layer.sublayers?
                .removeAll(where: {$0.name == "GradientBorder"})

            textField.layer.borderWidth = 1

            textField.layer.borderColor =
            UIColor.white.withAlphaComponent(0.2).cgColor
        }
    }
    
}
