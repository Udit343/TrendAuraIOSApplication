//  storesCollectionViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 21/07/26.


import UIKit

class storesCollectionViewCell: UICollectionViewCell {
     
    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    override func awakeFromNib() {
         super.awakeFromNib()
        
        storeName.font = UIFont.Outfit_Regular(size: 10)
        
        storeImageView.layer.cornerRadius = 16 * screenHeightFactor
        storeImageView.clipsToBounds = true
        
    }
    
    func configure(with item: StoreItem) {
        storeImageView.loadImage(from: item.image, placeholder: UIImage(named: "nikeLogo"))
            storeName.text = item.name
    }
}
