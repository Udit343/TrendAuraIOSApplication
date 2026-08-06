//  ProfileEditDropDownTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 03/08/26.


import UIKit

class ProfileEditDropDownTableViewCell: UITableViewCell{
    
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var dropdownTextField: UITextField!
    @IBOutlet weak var dropDownButton: UIButton!
    
    private let pickerView = UIPickerView()
    private var items: [String] = []
    
    
    var didSelectItem : ((String)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outerView.layer.cornerRadius = screenHeightFactor * 16
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        
        dropdownTextField.borderStyle = .none
        dropdownTextField.font = UIFont.Outfit_Regular(size: 14)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        dropdownTextField.inputView = pickerView
        
        selectionStyle = .none
    }
    
    func configure(with items: [String], placeholder: String) {

        self.items = items
        pickerView.reloadAllComponents()

        dropdownTextField.text = placeholder

//        dropdownTextField.setPlaceholder(
//            text: placeholder,
//            color: UIColor.white.withAlphaComponent(0.5),
//            font: UIFont.Outfit_Regular(size: 14)
//        )
    }
    
    
    @IBAction func dropDownButtonTapped(_ sender: UIButton) {
        dropdownTextField.becomeFirstResponder()
    }
    
}
    
    extension ProfileEditDropDownTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {

        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView,
                        numberOfRowsInComponent component: Int) -> Int {
            return items.count
        }

        func pickerView(_ pickerView: UIPickerView,
                        titleForRow row: Int,
                        forComponent component: Int) -> String? {
            return items[row]
        }

        func pickerView(_ pickerView: UIPickerView,
                        didSelectRow row: Int,
                        inComponent component: Int) {

            dropdownTextField.text = items[row]
            
            //dropdownTextField.resignFirstResponder()
            
            didSelectItem?(items[row])
        }
    }

