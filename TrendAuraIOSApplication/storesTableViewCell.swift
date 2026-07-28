//
//  storesTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 21/07/26.
//

import UIKit

class storesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    private var stores : [StoreItem] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        selectionStyle = .none
    }
    
    func configure(with stores: [StoreItem]) {
        self.stores = stores
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return stores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storesCollectionViewCell", for: indexPath) as!  storesCollectionViewCell
        
        let item = stores[indexPath.item]
        
        cell.configure(with: item)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: screenWidthFactor * 65, height: screenHeightFactor * 70)
    }
}
