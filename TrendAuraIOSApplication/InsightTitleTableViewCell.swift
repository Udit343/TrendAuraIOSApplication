//
//  InsightTitleTableViewCell.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 18/08/26.
//

import UIKit

class InsightTitleTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var mainTitle : UILabel!
    @IBOutlet weak var collectionView : UICollectionView!
    
    private var subtitles : [String] = []
    
    private var selectedIndex : Int = 0
    
    var onselection : ((Int)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        mainTitle.font = UIFont.Outfit_Medium(size: 15)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        collectionView.semanticContentAttribute = .forceRightToLeft
        
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                layout.minimumInteritemSpacing = 1
                layout.minimumLineSpacing = 1
            }
    }
    
    func configure(_ val : InsightTitle){
        mainTitle.text = val.title
        subtitles = val.subtitles
        

        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return subtitles.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsightSubSectionCollectionViewCell", for: indexPath) as! InsightSubSectionCollectionViewCell
        
        cell.configure(subtitles[indexPath.item], isSelected: indexPath.item == selectedIndex)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.item
        
        collectionView.reloadData()
        
        onselection?(indexPath.item)
    }
    
    
}
