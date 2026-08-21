//  UserProfileTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 07/08/26.

import UIKit

class UserProfileTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView : UICollectionView!
    
    var removeCard : (()->Void)?
    
   // @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        print("collectionView frame:", collectionView.frame)
//        print("contentSize:", collectionView.contentSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCollectionViewCell", for: indexPath) as! UserProfileCollectionViewCell
        
        cell.removeCard = {[weak self ] in
        
            self?.removeCard?()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 2
        let rowSpacing: CGFloat = 8
        
        return CGSize(
            width: 140 * screenWidthFactor ,
            height: 270 * screenHeightFactor
        )
    }
}
