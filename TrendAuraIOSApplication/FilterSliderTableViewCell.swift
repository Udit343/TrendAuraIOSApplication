//
//  FilterSliderTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 28/07/26.
//

import UIKit

class FilterSliderTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var minNumberLabel : UILabel!

    @IBOutlet weak var maxtitleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        minNumberLabel.font = UIFont.Outfit_Light(size: 11)
        maxtitleLabel.font = UIFont.Outfit_Light(size: 11)
        
        minNumberLabel.text = "10 Miles"
        maxtitleLabel.text = "100 Miles"
        
        slider.thumbTintColor = UIColor(hex: "C850C0")
        
        
        setupSlider()
        
        slider.addTarget(
            self,
            action: #selector(sliderValueChanged(_:)),
            for: .valueChanged
        )


        selectionStyle = .none
        
        slider.layer.cornerRadius = screenHeightFactor * 5

    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
        
        let gradient = UIImage.gradientImage(
                colors: [
                    UIColor(hex: "4C57CF"),
                    UIColor(hex: "C850C0"),
                    UIColor(hex: "FFCC70")
                    
                ],
                size: CGSize(width: 300, height: 10)
            )

            slider.setMinimumTrackImage(
                gradient.resizableImage(withCapInsets: .zero),
                for: .normal
            )

           slider.maximumTrackTintColor = UIColor.white.withAlphaComponent(0.3)
    }
    
    private func setupSlider(){
        
        let thumbImage = createThumbImage(
                    size: CGSize(width: 16, height: 16),
                   // color: UIColor(hex: "C850C0")
                )
        
        slider.setThumbImage(
                   thumbImage,
                   for: .normal
               )
    }
    
    private func createThumbImage(
        size: CGSize
    ) -> UIImage {


        let renderer = UIGraphicsImageRenderer(
            size: size
        )


        return renderer.image { context in


            let gradientLayer = CAGradientLayer()

            gradientLayer.frame = CGRect(
                origin: .zero,
                size: size
            )


            gradientLayer.colors = [

                UIColor(hex: "4C57CF").cgColor,
                UIColor(hex: "C850C0").cgColor,
                UIColor(hex: "FFCC70").cgColor,

            ]
            gradientLayer.startPoint = CGPoint(
                x: 1,
                y: 0
            )
            gradientLayer.endPoint = CGPoint(
                x: 0,
                y: 1
            )
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = UIBezierPath(
                ovalIn: CGRect(
                    origin: .zero,
                    size: size
                )
            ).cgPath
            gradientLayer.mask = shapeLayer
            gradientLayer.render(
                in: context.cgContext
            )
        }

    }
    
    @objc private func sliderValueChanged(
        _ sender: UISlider
    ){

        updateSliderTrack()

    }
    
    private func updateSliderTrack(){


        let totalWidth: CGFloat = 300


        let percentage =
        CGFloat(
            (slider.value - slider.minimumValue) /
            (slider.maximumValue - slider.minimumValue)
        )


        let gradientWidth =
        totalWidth * percentage



        let gradient = UIImage.gradientImage(

            colors: [

                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")

            ],

            size: CGSize(
                width: max(gradientWidth, 1),
                height: 6
            )
        )
        slider.setMinimumTrackImage(
            gradient.resizableImage(
                withCapInsets: .zero
            ),
            for: .normal
        )
        slider.maximumTrackTintColor =
        UIColor.white.withAlphaComponent(0.3)

    }
    
}
