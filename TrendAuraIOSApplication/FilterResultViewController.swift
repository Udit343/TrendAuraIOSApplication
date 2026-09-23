//  FilterResultViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 09/09/26.

import UIKit

class FilterResultViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var collectionView : UICollectionView!
    
    var reels: [ReelItem] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont.Outfit_Medium(size: 20)
        titleLabel.text = "Filtered Results"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return reels.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterResultCollectionViewCell", for: indexPath) as! FilterResultCollectionViewCell
        
        let reel = reels[indexPath.item]
        let product = reel.toProductItem()
        
        cell.configure(with: product)
        
        cell.onCartToggle = { [weak self] currentlyFavourite, completion in
                self?.toggleCart(product: product, currentlyFavourite: currentlyFavourite, completion: completion)
            }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: screenWidthFactor * 133, height: screenHeightFactor * 220)
    }
    
    @IBAction func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    // REPLACES addToCart(product:)
    func toggleCart(product: ProductItem, currentlyFavourite: Bool, completion: @escaping (Bool) -> Void) {
        Task {
            do {
                let message: String
                if currentlyFavourite {
                    let response = try await ExploreService.shared.removeFromCart(reelId: String(product.reelId))
                    message = response.message
                } else {
                    let response = try await ExploreService.shared.addFavouriteReels(reelId: String(product.reelId))
                    message = response.message
                }
                show_Alert(message: message)
                completion(true)
            } catch {
                show_Alert(message: error.localizedDescription)
                completion(false)
            }
        }
    }
}
