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
        
        selectionStyle = .none

    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
        
        let gradient = UIImage.gradientImage(
                colors: [
                    UIColor(hex: "FFCC70"),
                    UIColor(hex: "C850C0"),
                    UIColor(hex: "4C57CF")
                    
                ],
                size: CGSize(width: 300, height: 4)
            )

            slider.setMinimumTrackImage(
                gradient.resizableImage(withCapInsets: .zero),
                for: .normal
            )

           slider.maximumTrackTintColor = UIColor.white.withAlphaComponent(0.3)
    }
    
}
