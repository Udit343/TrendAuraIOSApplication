//  TrandingTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 21/07/26.


import UIKit

class TrandingTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var collectionView : UICollectionView!
    
    private var hotItems : [HotItem] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
               layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
               layout.minimumInteritemSpacing = 8
               layout.minimumLineSpacing = 8
           }
        
        selectionStyle = .none
        
    }
    
    func configure(with hotItems: [HotItem]){
        self.hotItems = hotItems
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return  hotItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrandingCollectionViewCell", for: indexPath) as!
        TrandingCollectionViewCell
        
        let item = hotItems[indexPath.item]
        
        cell.configure(with: item)
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: screenWidthFactor * 110, height: screenHeightFactor * 38)
//    }
    
}
