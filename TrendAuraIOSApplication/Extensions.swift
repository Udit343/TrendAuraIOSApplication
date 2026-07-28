//  Extensions.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 20/07/26.


import Foundation
import UIKit


// get color RGB value
extension UIColor {
    convenience init(hex: String) {

           var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
           hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

           var rgb: UInt64 = 0
           Scanner(string: hexSanitized).scanHexInt64(&rgb)

           self.init(
               red: CGFloat((rgb & 0xFF0000) >> 16) / 255,
               green: CGFloat((rgb & 0x00FF00) >> 8) / 255,
               blue: CGFloat(rgb & 0x0000FF) / 255,
               alpha: 1
           )
       }
}


// use regb vlaue
extension UIColor {

    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpha
        )
    }
}


// set placeholdercolor
extension UITextField {
    func setPlaceholder(
        text: String,
        color: UIColor,
        font: UIFont
    ) {
        attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: color,
                .font: font
            ]
        )
    }
}


// give gradient color for Label
extension UILabel {

    func applyGradientText(
        colors: [UIColor],
        startPoint: CGPoint = CGPoint(x: 1, y: 0),
        endPoint: CGPoint = CGPoint(x: 0, y: 1)
    ) {

        guard let text = text else { return }

        let textSize = (text as NSString).size(withAttributes: [.font: font as Any])

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: textSize)
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint

        UIGraphicsBeginImageContextWithOptions(textSize, false, 0)

        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return
        }

        gradientLayer.render(in: context)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if let image = image {
            textColor = UIColor(patternImage: image)
        }
    }
}



extension UIButton {

    func applyGradientForButton(
        colors: [UIColor],
        startPoint: CGPoint = CGPoint(x: 1, y: 0),
        endPoint: CGPoint = CGPoint(x: 0, y: 1)
    ) {

        layer.sublayers?.removeAll(where: { $0.name == "GradientLayer" })

        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "GradientLayer"
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.cornerRadius = layer.cornerRadius

        layer.insertSublayer(gradientLayer, at: 0)
    }
}



extension UIButton {

    func applyGradientTitle(
        colors: [UIColor],
        startPoint: CGPoint = CGPoint(x: 0, y: 0.5),
        endPoint: CGPoint = CGPoint(x: 1, y: 0.5)
    ) {

        guard let title = self.title(for: .normal),
              let font = titleLabel?.font else { return }

        let textSize = (title as NSString).size(withAttributes: [.font: font])

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: textSize)
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint

        UIGraphicsBeginImageContextWithOptions(textSize, false, 0)

        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return
        }

        gradientLayer.render(in: context)

        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return
        }

        UIGraphicsEndImageContext()

        setTitleColor(UIColor(patternImage: image), for: .normal)
    }
}



//applyGradientBorder
extension UIView {

    func applyGradientBorder(
        colors: [UIColor],
        borderWidth: CGFloat = 1,
        cornerRadius: CGFloat? = nil,
        startPoint: CGPoint = CGPoint(x: 0, y: 0.5),
        endPoint: CGPoint = CGPoint(x: 1, y: 0.5)
    ) {

        layoutIfNeeded()

        layer.sublayers?.removeAll {
            $0.name == "GradientBorder"
        }

        let gradient = CAGradientLayer()
        gradient.name = "GradientBorder"
        gradient.frame = bounds
        gradient.colors = colors.map(\.cgColor)
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint

        let radius = cornerRadius ?? layer.cornerRadius

        let shape = CAShapeLayer()
        shape.path = UIBezierPath(
            roundedRect: bounds.insetBy(
                dx: borderWidth / 2,
                dy: borderWidth / 2
            ),
            cornerRadius: radius - borderWidth / 2
        ).cgPath

        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        shape.lineWidth = borderWidth

        gradient.mask = shape

        layer.addSublayer(gradient)
    }
}
// view background
extension UIView {

    func applyGradientBackground(
        colors: [UIColor],
        startPoint: CGPoint = CGPoint(x: 0, y: 0.5),
        endPoint: CGPoint = CGPoint(x: 1, y: 0.5)
    ) {

        layoutIfNeeded()

        layer.sublayers?.removeAll(where: {
            $0.name == "GradientBackground"
        })

        let gradient = CAGradientLayer()
        gradient.name = "GradientBackground"
        gradient.frame = bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.cornerRadius = layer.cornerRadius

        layer.insertSublayer(gradient, at: 0)
    }
}




//for slider
extension UIImage {

    static func gradientImage(
        colors: [UIColor],
        size: CGSize
    ) -> UIImage {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: size)
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)

        UIGraphicsBeginImageContextWithOptions(size, false, 0)

        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }

        gradientLayer.render(in: context)

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image ?? UIImage()
    }
}
