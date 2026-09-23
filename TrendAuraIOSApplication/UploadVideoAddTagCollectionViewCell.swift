//  UploadVideoAddTagCollectionViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 15/09/26.

import UIKit

class UploadVideoAddTagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var removeTagLabel : UILabel!
    @IBOutlet weak var removeTabButton : UIButton!
    
    var onRemoveTapped : (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.layer.cornerRadius = 12 * screenHeightFactor
        outerView.layer.borderWidth = 1.3
        outerView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        
        removeTagLabel.font = UIFont.Outfit_Light(size: 13)
        
        removeTabButton.addTarget(self, action: #selector(RemoveTapped), for: .touchUpInside)
    }
    
    @objc func RemoveTapped(){
          onRemoveTapped?()
    }
    
    func configure(with tag : String){
        removeTagLabel.text = tag
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        outerView.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF"),
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
        
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        onRemoveTapped = nil
    }
}
