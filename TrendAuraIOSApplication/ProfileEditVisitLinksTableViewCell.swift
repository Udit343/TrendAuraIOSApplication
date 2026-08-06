//
//  ProfileEditVisitLinksTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 03/08/26.
//

import UIKit

class ProfileEditVisitLinksTableViewCell: UITableViewCell {

    @IBOutlet weak var linkIcon : UIImageView!
    @IBOutlet weak var linkTextField : UITextField!
    @IBOutlet weak var outerView : UIView!
    
    var didChangeLink: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        linkTextField.addTarget(
            self,
            action: #selector(textChanged),
            for: .editingChanged
        )
        
        linkTextField.borderStyle = .none
        
        outerView.layer.cornerRadius = screenHeightFactor * 17
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        
        linkTextField.font = UIFont.Outfit_Regular(size: 14)
        
        selectionStyle = .none
    }
    
    func configure(with link: LinkInfo, text: String) {

            linkIcon.image = UIImage(named: link.imageName)

            linkTextField.text = text

            linkTextField.setPlaceholder(
                text: link.placeholder,
                color: UIColor(hex: "FFFFFF").withAlphaComponent(0.5),
                font: UIFont.Outfit_Regular(size: 12)
            )
        }

    
    @objc func textChanged() {
        didChangeLink?(linkTextField.text ?? "")
        
        //print("Text Changed:", linkTextField.text ?? "")
    }
    
    
}
