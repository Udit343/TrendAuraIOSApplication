//  SearchViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 23/07/26.


import UIKit
class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var enterkeyWordLabel: UILabel!
    @IBOutlet weak var exploreImageView: UIImageView!
    @IBOutlet weak var exploreView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var exploreLabel: UILabel!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var promosCollectionView : UICollectionView!
    
    @IBOutlet weak var userTableView : UITableView!
    @IBOutlet weak var hashTagTableView : UITableView!
    
    @IBOutlet weak var searchButton: UIButton!
    
    var selectedCategory : SearchCategory = .all
    
    var selectedCategoryIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exploreLabel.font = UIFont.Outfit_Medium(size: 24)
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.3).cgColor
        searchTextField.borderStyle = .none
        searchTextField.setPlaceholder(
            text: "@jak",
            color: UIColor(hex: "F3F4F8"),
            font: UIFont.Outfit_Regular(size: 14)
        )
        
        searchView.layer.cornerRadius = screenHeightFactor * 14
        
//        searchButton.layer.borderWidth = 2
//        searchButton.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.3).cgColor
//        searchButton.layer.cornerRadius = searchButton.frame.height / 2
//        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        userTableView.dataSource = self
        userTableView.delegate = self
        
        hashTagTableView.dataSource = self
        hashTagTableView.delegate = self
        
        promosCollectionView.dataSource = self
        promosCollectionView.delegate = self
        
        userTableView.rowHeight = UITableView.automaticDimension
        userTableView.estimatedRowHeight = 140
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                layout.minimumInteritemSpacing = 8
                layout.minimumLineSpacing = 8
            }
        
        
        enterkeyWordLabel.font = UIFont.Outfit_Medium(size: 18)
        
        descriptionLabel.font = UIFont.Outfit_Light(size: 12)
        
            updateScreen()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       if  collectionView ==  promosCollectionView{
           return cardItems.count
       }else{
           return CategoryName.count
       }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView ==  promosCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardPromosCollectionViewCell", for: indexPath) as! CardPromosCollectionViewCell
            
            cell.configure(with: cardItems[indexPath.item])
            
            return cell
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            
            cell.configuration(with: CategoryName[indexPath.item])
            
            cell.updateUI(isSelected: indexPath.item == selectedCategoryIndex)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == promosCollectionView {

                return CGSize(
                    width: 0.47 * promosCollectionView.frame.width ,
                    height: 0.64 * promosCollectionView.frame.height
                )

            } else {

                return UICollectionViewFlowLayout.automaticSize
            }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard collectionView == self.collectionView  else { return}
        
        let selectedItem = indexPath.item
        
        switch indexPath.item {
        case 0:
                selectedCategory = .all

            case 1:
                selectedCategory = .users

            case 2:
                selectedCategory = .promos

            case 3:
                selectedCategory = .hashtags

            default:
                break
            
        }
        
        updateScreen()
        
        selectedCategoryIndex = indexPath.item
        
        collectionView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == userTableView {
                return usersData.count
            } else {
                return hashTagData.count
            }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if tableView == userTableView {

                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "UsersTableViewCell",
                    for: indexPath
                ) as! UsersTableViewCell

                cell.configure(with: usersData[indexPath.row])
            
                

                return cell

            } else {

                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "HashTagTableViewCell",
                    for: indexPath
                ) as! HashTagTableViewCell

                cell.configure(with: hashTagData[indexPath.row])

                return cell
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == userTableView {
            
            let profileVC  = storyboard?.instantiateViewController(withIdentifier: "ProfilePageViewController") as! ProfilePageViewController
            
            let nav  = UINavigationController(rootViewController: profileVC)
            
            nav.modalTransitionStyle = .crossDissolve
            nav.modalPresentationStyle = .overFullScreen
            
            present(nav, animated: true)
            
            
        }
    }
    
    func updateScreen(){
        exploreView.isHidden = true
        userTableView.isHidden = true
        promosCollectionView.isHidden = true
        hashTagTableView.isHidden = true
        
        switch selectedCategory {
            
        case .all:
            exploreView.isHidden = false
        case .users:
            userTableView.isHidden = false
        case .promos:
            promosCollectionView.isHidden = false
        case .hashtags:
            hashTagTableView.isHidden = false
        }
    }
    
    @IBAction func BackButton(_ sender : UIButton){
             
        navigationController?.popViewController(animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == hashTagTableView{
            return screenHeightFactor * 50
        }else{
            return UITableView.automaticDimension
        }
    }
    
    @IBAction func filterPage(_ sender : UIButton){
        
        let filterVC = storyboard?.instantiateViewController(withIdentifier: "FilterViewController")as! FilterViewController
        
        filterVC.modalPresentationStyle = .overFullScreen
        filterVC.modalTransitionStyle = .crossDissolve
        
        present(filterVC, animated: true)
    }
}
