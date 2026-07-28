//  SignUpViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 20/07/26.


import UIKit

class SignUpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var signInButton: UIButton!

    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView : UITableView!
    
    
    
    struct SignUpForm {
        var name = ""
        var email = ""
        var password = ""
        var confirmPassword = ""
    }

    var form = SignUpForm()
    
    var  isTermsAccepted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.font = UIFont.Outfit_SemiBold(size: 14)
        mainTitleLabel.font = UIFont.Outfit_Bold(size: 34)
        subTitleLabel.font = UIFont.Outfit_Regular(size: 13)
        accountLabel.font = UIFont.Outfit_Medium(size: 13)
        signInButton.titleLabel?.font = UIFont.Outfit_Medium(size: 13)
        signUpButton.titleLabel?.font = UIFont.Outfit_Bold(size: 13)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 35
                
        signUpButton.layer.cornerRadius = screenHeightFactor * 17
        //signUpButton.titleLabel?.font = UIFont.Outfit_Bold(size: 18)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let tap = UITapGestureRecognizer(
                target: self,
                action: #selector(hideKeyboard)
            )
        
        tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
    }
    
    @objc
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        //logInButton.layer.cornerRadius = screenHeightFactor * 18

        titleLabel.applyGradientText(
            colors: [
                UIColor(hex: "FF116A"),
                UIColor(hex: "FED150")
            ]
        )

        signUpButton.applyGradientForButton(
            colors: [
                
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ]
        )
        
        signInButton.applyGradientTitle(colors: [UIColor(hex: "FFCC70"),
                                                 UIColor(hex: "C850C0"),
                                                 UIColor(hex: "4C57CF")],
                                        startPoint: CGPoint(x: 1, y: 0),
                                        endPoint: CGPoint(x: 0, y: 1)
        )
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SignUpData.count * 2 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let lastRow = SignUpData.count * 2
        
        if indexPath.row == lastRow{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TermAndConditionTableViewCell", for: indexPath) as! TermAndConditionTableViewCell
            
            cell.configuration()
            
            cell.checkBoxChanged = { [weak self] value in

                self?.isTermsAccepted = value
            }
            
            return cell

        }
        
        let data = SignUpData[indexPath.row/2]
        
        if indexPath.row % 2 == 0 {
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "SignUpTitleTableViewCell",
                for: indexPath
            ) as! SignUpTitleTableViewCell
            
          
            cell.titleLabel.text = data.title

            return cell
            
        } else {

                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "SignUpTableViewCell",
                    for: indexPath
                ) as! SignUpTableViewCell

                cell.configure(data: data)
            
            cell.textChanged = { [weak self] text in
                guard let self = self else { return }

                switch data.fieldType {

                case .name:
                    self.form.name = text

                case .email:
                    self.form.email = text

                case .password:
                    self.form.password = text

                case .confirmPassword:
                    self.form.confirmPassword = text
                }
            }

                return cell
            }
    }
    
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {

        let lastRow = SignUpData.count * 2

        if indexPath.row == lastRow {
            return UITableView.automaticDimension
        }

        return screenHeightFactor * 35
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        guard !form.name.isBlank() else {
            show_Alert(message: "Please enter name.")
            return
        }

        guard form.name.isValidName() else {
            show_Alert(message: "Name must be at least 3 characters.")
            return
        }
        
        guard !form.email.isBlank() else {
            show_Alert(message: "Please enter your email.")
            return
        }
        
        guard form.email.isValidEmail() else{
            show_Alert(message: "Please enter a valid email address.")
            return
        }
        
        guard !form.password.isBlank() else {
            show_Alert(message: "Please enter password.")
            return
        }

        guard form.password.isValidPassword() else {
            show_Alert(message: "Password must be at least 8 characters.")
            return
        }
        
        guard !form.confirmPassword.isBlank() else {
            show_Alert(message: "Please confirm your password.")
            return
        }
        
        guard form.password == form.confirmPassword else {
            show_Alert(message: "Passwords do not match.")
            return
        }
        
        guard isTermsAccepted else {
            show_Alert(message: "Please accept Terms & Conditions.")
            return
        }
        
        let CodeVerificationViewControllerVC = storyboard?.instantiateViewController(withIdentifier: "CodeVerificationViewController") as! CodeVerificationViewController
        
//        navigationController?.pushViewController(CodeVerificationViewControllerVC, animated: true)
        
        CodeVerificationViewControllerVC.modalPresentationStyle = .overFullScreen
        CodeVerificationViewControllerVC.modalTransitionStyle = .crossDissolve
        
        self.present(CodeVerificationViewControllerVC, animated: true)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func signInPage(_ sender : UIButton){
        let SignVC = storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        
        navigationController?.pushViewController(SignVC, animated: true)
    }
    
}
