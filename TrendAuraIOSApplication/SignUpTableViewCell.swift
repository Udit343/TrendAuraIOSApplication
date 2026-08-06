//  SignUpTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 21/07/26.


import UIKit

class SignUpTableViewCell: UITableViewCell {
    
    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var commonTextField : UITextField!
    @IBOutlet weak var hideShowButton: UIButton!
    @IBOutlet weak var hideShowImageView: UIImageView!

    var textChanged: ((String) -> Void)?
    
    var isPasswordVisible = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonTextField.borderStyle = .none
        
        selectionStyle = .none
        
        commonTextField.addTarget(
            self,
            action: #selector(textDidChange),
            for: .editingChanged
        )
        
        
//        commonTextField.setPlaceholder(text: "Enter Name", color: UIColor(red: 255, green: 255, blue: 255, alpha: 0.5) , font: UIFont.Outfit_Regular(size: 17))
        
        outerView.layer.cornerRadius = screenHeightFactor * 17
        
        outerView.layer.borderWidth = 0.6
        outerView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.3).cgColor
        
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//
//    }
    
    func configure(data: InputModel) {

        commonTextField.setPlaceholder(
            text: data.placeholder,
            color: UIColor.white.withAlphaComponent(0.5),
            font: UIFont.Outfit_Regular(size: 13)
        )

        commonTextField.isSecureTextEntry = data.secure

        hideShowButton.isHidden = !data.secure
        hideShowImageView.isHidden = !data.secure
        
        commonTextField.isSecureTextEntry = data.secure

        isPasswordVisible = !data.secure
    }
    
    @objc
    func textDidChange() {
        textChanged?(commonTextField.text ?? "")
    }
    
    @IBAction func hideShowButtonTapped(_ sender: UIButton) {

        isPasswordVisible.toggle()

        commonTextField.isSecureTextEntry = !isPasswordVisible

        let image = isPasswordVisible ?

        UIImage(named: "showPassword") :

        UIImage(named: "hidePassword")

        hideShowImageView.image = image
    }
}
