//  ExploreViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 21/07/26.


import UIKit
import Foundation

class ExploreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var exploreLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    let viewModel = ExploreViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        exploreLabel.font = UIFont.Outfit_Medium(size: 21)
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.3).cgColor
        searchTextField.borderStyle = .none
        searchTextField.setPlaceholder(
            text: "Explore Products, Brands & more...",
            color: UIColor(hex: "F3F4F8"),
            font: UIFont.Outfit_Regular(size: 11)
        )
        
        searchView.layer.cornerRadius = screenHeightFactor * 13
        
//        searchButton.layer.borderWidth = 2
//        searchButton.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.3).cgColor
//        searchButton.layer.cornerRadius = searchButton.frame.height / 2
//        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.onError = {[weak self] message in
            self?.show_Alert(message: message)
        }
        
        viewModel.onDataLoaded = {[weak self] in
            self?.tableView.reloadData()
        }
        
        searchTextField.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToSearch))
        
        searchTextField.addGestureRecognizer(tapGesture)
        
    }
    
    @objc
    func goToSearch() {
        let searchVC = storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        viewModel.fetchExplore()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return ExploreDummyData.sections.count
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       // let section = ExploreDummyData.sections[indexPath.section]
        let section = viewModel.sections[indexPath.section]
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for: indexPath) as! TitleTableViewCell
            
            cell.configure(with: section.title)
            
            return cell
        }
        
        switch section.type {
            
        case .tags(_, let item):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrandingTableViewCell", for: indexPath) as!  TrandingTableViewCell
            
            cell.configure(with: item)
            
            return cell
        
        case .stores(_, let item):
            let cell = tableView.dequeueReusableCell(withIdentifier: "storesTableViewCell", for: indexPath) as! storesTableViewCell
            
            cell.configure(with: item)
            
            return cell
            
        
        case .reels(_, let item):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as! CardTableViewCell
            
            cell.configure(with: item)
            
            cell.onCartToggle = { [weak self] product, currentlyFavourite, completion in
                    self?.toggleCart(product: product, currentlyFavourite: currentlyFavourite, completion: completion)
                }
            
//            cell.didSelectCollectionItem = { [weak self] indexPath in
//
//                guard let self = self else { return }
//
//                let detailsVC = self.storyboard?.instantiateViewController(
//                    withIdentifier: "SearchViewController"
//                ) as! SearchViewController
//
//                self.navigationController?.pushViewController(detailsVC, animated: true)
//            }
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.row == 0 {
            return screenHeightFactor * 33
        }

        let section = viewModel.sections[indexPath.section]
        switch section.type {

        case .tags:
            return screenHeightFactor * 37

        case .stores:
            return screenHeightFactor * 70

        case .reels:
//            return tableView.frame.height * 0.51
            
            return screenHeightFactor * 260
        }
    }
    
    @IBAction func filterPage(_ sender : UIButton){
        let filterVC = storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController

//            filterVC.onFiltersApplied = { [weak self] reels in
//                guard let self = self else { return }
//
                //self.viewModel.applyFilteredReels(reels)
//                self.tableView.reloadData()
//            }
        
        filterVC.hostNavigationController = self.navigationController 

            filterVC.modalPresentationStyle = .overFullScreen
            filterVC.modalTransitionStyle = .crossDissolve
            present(filterVC, animated: true)
    }
    
    
//    
//    func addTocart(product : ProductItem){
//        
//        Task{
//            do{
//                let argId = String(product.reelId)
//                
//                let response = try await ExploreService.shared.addToCart(reelId: argId)
//                
//                show_Alert(message: response.message)
//                
//            }catch{
//                show_Alert(message: error.localizedDescription)
//            }
//        }
//    }
    

    func toggleCart(product: ProductItem, currentlyFavourite: Bool, completion: @escaping (Bool) -> Void) {
        Task {
            do {
                let message: String
                if currentlyFavourite {
                    let response = try await ExploreService.shared.removeFromCart(reelId: String(product.reelId))
                    message = response.message
                } else {
                    
                    let response = try await
                    ExploreService.shared.addFavouriteReels(reelId: String(product.reelId))
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
