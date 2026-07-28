//  CardTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 21/07/26.


import UIKit

class CardTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    private var products : [ProductItem] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        selectionStyle = .none
        
    }
    
    func configure(with products: [ProductItem]) {
            self.products = products
            collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        
        let product = products[indexPath.item]
        
        cell.configure(with: product)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {

            return CGSize(width: screenWidthFactor * 180, height: screenHeightFactor * 250)
}
    
    var didSelectCollectionItem: ((IndexPath) -> Void)?

       func collectionView(_ collectionView: UICollectionView,
                           didSelectItemAt indexPath: IndexPath) {

           didSelectCollectionItem?(indexPath)
       }
}
