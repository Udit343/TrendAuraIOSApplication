//
//  PersonalChatSendTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 14/08/26.
//

import UIKit

class PersonalChatSendTableViewCell: UITableViewCell {

    @IBOutlet weak var OuterView  : UIView!
    @IBOutlet weak var messageView : UIView!
    @IBOutlet weak var messageLabel : UILabel!
    @IBOutlet weak var timeLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        messageLabel.font = UIFont.Outfit_Regular(size: 13.4)
        timeLabel.font = UIFont.Outfit_Regular(size: 9)
        
        
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        messageView.layer.cornerRadius = 7 * screenHeightFactor
//
//        messageView.layer.maskedCorners = [
//            .layerMinXMinYCorner,   // Top-left
//            .layerMaxXMinYCorner,   // Top-right
//            .layerMinXMaxYCorner    // Bottom-left
//        ]
//        
//        messageView.applyGradientBorder(
//            colors: [
//                
//                UIColor(hex: "FFCC70"),
//                UIColor(hex: "C850C0"),
//                UIColor(hex: "4C57CF")
//            ],
//            borderWidth: 1,
//            startPoint: CGPoint(x: 1, y: 0),
//            endPoint: CGPoint(x: 0, y: 1)
//        )
//
//        //messageView.layer.masksToBounds = true
//
//        messageView.applyGradientBackground(
//            colors: [
//                UIColor(hex: "FFCC70"),
//                UIColor(hex: "C850C0"),
//                UIColor(hex: "4C57CF")
//            ],
//            startPoint: CGPoint(x: 1, y: 0),
//            endPoint: CGPoint(x: 0, y: 1)
//        )
//    }
    
   
        private var gradientLayer: CAGradientLayer?

        
        override func layoutSubviews() {
            super.layoutSubviews()
            messageView.layer.cornerRadius = 7 * screenHeightFactor
            messageView.layer.maskedCorners = [
                .layerMinXMinYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner
            ]
            messageView.layer.masksToBounds = true

            
            updateGradientFrame()
        }

        private func updateGradientFrame() {
            if gradientLayer == nil {
                let gradient = CAGradientLayer()
                gradient.name = "GradientBackground"
                gradient.colors = [
                    UIColor(hex: "FFCC70").cgColor,
                    UIColor(hex: "C850C0").cgColor,
                    UIColor(hex: "4C57CF").cgColor
                ]
                gradient.startPoint = CGPoint(x: 1, y: 0)
                gradient.endPoint = CGPoint(x: 0, y: 1)
                messageView.layer.insertSublayer(gradient, at: 0)
                gradientLayer = gradient
            }
            
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            gradientLayer?.frame = messageView.bounds
            CATransaction.commit()
        }
    }

