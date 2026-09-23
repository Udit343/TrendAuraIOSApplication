//  UserProfileTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 07/08/26.

import UIKit

class UserProfileTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView : UICollectionView!
    
    private var reels: [FavouriteReelItem] = []
       var removeCard: ((Int) -> Void)?
    
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
        return reels.count
        
    }
    
    func configure(with reels: [FavouriteReelItem]) {
            self.reels = reels
            collectionView.reloadData()
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCollectionViewCell", for: indexPath) as! UserProfileCollectionViewCell
        
        let reel = reels[indexPath.item]
        
        cell.configure(with: reel.toProductItem(), addedDate: reel.formattedAddedDate)

                cell.removeCard = { [weak self] in
                    self?.removeCard?(reel.reelId)
                }

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(
            width: 140 * screenWidthFactor ,
            height: 270 * screenHeightFactor
        )
    }
}
