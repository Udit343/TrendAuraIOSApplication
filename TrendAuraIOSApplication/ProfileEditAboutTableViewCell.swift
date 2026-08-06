//
//  ProfileEditAboutTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 03/08/26.
//

import UIKit

class ProfileEditAboutTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var textView : UITextView!
    @IBOutlet weak var outerView : UIView!
    
    var didChangedText : ((String)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.layer.cornerRadius = screenHeightFactor * 14
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        
        textView.text = "Enter here...."
        textView.textColor = UIColor.white.withAlphaComponent(0.5)
        textView.font = UIFont.Outfit_Regular(size: 13)
        textView.delegate = self
        
        selectionStyle = .none
    }
    
    func textViewDidChange(_ textView: UITextView) {
        didChangedText?(textView.text)
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == UIColor.white.withAlphaComponent(0.5){
                textView.text = ""
                textView.textColor = .white
            }
        }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "Enter here...."
            textView.textColor = UIColor.white.withAlphaComponent(0.5)
            textView.font = UIFont.Outfit_Regular(size: 15)
        }
    }
}
