//  URLImageView.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 03/09/26.


import UIKit

extension UIImageView {
    func loadImage(from urlString : String, placeholder : UIImage? = nil){
        self.image = placeholder
        
        guard let url = URL(string: urlString), !urlString.isEmpty else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                    guard let data = data, let image = UIImage(data: data), error == nil else { return }
                    DispatchQueue.main.async {
                        self?.image = image
                    }
        }.resume()
         
    }
}
