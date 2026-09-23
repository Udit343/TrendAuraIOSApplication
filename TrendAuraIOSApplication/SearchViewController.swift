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
    
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exploreLabel.font = UIFont.Outfit_Medium(size: 24)
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.3).cgColor
        searchTextField.borderStyle = .none
        searchTextField.setPlaceholder(
            text: " ",
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
        
        searchTextField.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
        
        viewModel.onError = {[weak self] message in
            self?.show_Alert(message: message)
        }
        
        viewModel.onResultsUpdated = {[weak self] in
            guard let self = self else {return}
            
            self.userTableView.reloadData()
            self.promosCollectionView.reloadData()
            self.hashTagTableView.reloadData()
        }
        
            updateScreen()
        
    }
    
    @objc func searchTextChanged(){
        let query = searchTextField.text ?? ""
        viewModel.search(query: query, category: selectedCategory)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       if  collectionView ==  promosCollectionView{
           return viewModel.promos.count
           //return cardItems.count
       }else{
           return CategoryName.count
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView ==  promosCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardPromosCollectionViewCell", for: indexPath) as! CardPromosCollectionViewCell
            
            let reel = viewModel.promos[indexPath.item]
            
            cell.configure(with: reel.toProductItem())
            
            let product = reel.toProductItem()
            
            cell.onCartToggle = { [weak self] currentlyFavourite, completion in
                self?.toggleCart(product: product, currentlyFavourite: currentlyFavourite, completion: completion)
            }
              
           // cell.configure(with: cardItems[indexPath.item])
            
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
                    width: 0.475 * promosCollectionView.frame.width ,
                    height: 0.64 * promosCollectionView.frame.height
                )

            } else {

                return UICollectionViewFlowLayout.automaticSize
            }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard collectionView == self.collectionView  else { return}
        
        _ = indexPath.item
        
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
        
        viewModel.search(query: searchTextField.text ?? "", category: selectedCategory)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == userTableView {
            return viewModel.users.count
            } else {
                return viewModel.hashtags.count
            }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if tableView == userTableView {

                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "UsersTableViewCell",
                    for: indexPath
                ) as! UsersTableViewCell

               // cell.configure(with: usersData[indexPath.row])
            cell.configure(with: viewModel.users[indexPath.row])
                return cell

            } else {

                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "HashTagTableViewCell",
                    for: indexPath
                ) as! HashTagTableViewCell

                //cell.configure(with: hashTagData[indexPath.row])
                
                cell.configure(with: viewModel.hashtags[indexPath.row])

                return cell
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
        
        let filterVC = storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController

//            filterVC.onFiltersApplied = { [weak self] reels in
//                guard let self = self else { return }

                //self.viewModel.applyFilteredReels(reels)
//                self.selectedCategory = .promos
//                self.selectedCategoryIndex = 2
//                self.updateScreen()
//                self.collectionView.reloadData()
//                self.promosCollectionView.reloadData()
//            }

        filterVC.hostNavigationController = self.navigationController
        
            filterVC.modalPresentationStyle = .overFullScreen
            filterVC.modalTransitionStyle = .crossDissolve
            present(filterVC, animated: true)
    }
    
    
    // ExploreViewModel — add this function
//    func applyFilteredReels(_ reels: [ReelItem]) {
//        let filteredSection = ExploreSections(type: .reels(
//            title: "Filtered Results",
//            items: reels.map { $0.toProductItem() }
//        ))
//        self.sections = [filteredSection]
//    }
    
    @IBAction func CancelButtonTapped(_ sender : UIButton){
        
        searchTextField.text = ""
        searchTextField.resignFirstResponder()
        
    }
    
    
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
