//
//  Validation.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 23/07/26.
//

import Foundation
import UIKit

extension UIViewController {
    func show_Alert(title : String = "Error", message : String){
         
        let alert = UIAlertController(
            title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert,animated: true)
    }
}


extension UITextField {
    
    func isEmpty() -> Bool {
        return self.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
    }
    func isValidEmail() -> Bool {
        guard let email = self.text else {
            return false
        }
        
        let emailRegex =
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
    }
    
    func isValidPassword() -> Bool {

        guard let password = self.text else {
            return false
        }

        return password.count >= 8
    }

    func isValidName() -> Bool {

        guard let name = self.text else {
            return false
        }

        return name.count >= 3
    }
}


extension UITextField {

    func isSingleCharacter(_ string: String) -> Bool {
        return string.count == 1 && string.allSatisfy(\.isNumber)
    }
}

extension String {

    func isBlank() -> Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    func isValidEmail() -> Bool {

        let emailRegex =
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        return NSPredicate(format: "SELF MATCHES %@", emailRegex)
            .evaluate(with: self)
    }

    func isValidPassword() -> Bool {
        count >= 8
    }

    func isValidName() -> Bool {
        count >= 3
    }
}

//extension UIButton {
//    func isTermsAccepted()-> Bool{
//
//        show_Alert(message: "Please accept Terms & Conditions.")
//
//        return
//    }
//}
