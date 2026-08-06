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
    }
    
    func configure(with item: StoreItem) {
            storeImageView.image = UIImage(named: item.image)
            storeName.text = item.name
    }
}
