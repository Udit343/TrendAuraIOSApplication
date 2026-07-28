//  ExploreViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 21/07/26.


import UIKit

class ExploreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var exploreLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
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
        
        searchView.layer.cornerRadius = screenHeightFactor * 14
        
//        searchButton.layer.borderWidth = 2
//        searchButton.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.3).cgColor
//        searchButton.layer.cornerRadius = searchButton.frame.height / 2
//        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ExploreDummyData.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = ExploreDummyData.sections[indexPath.section]
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for: indexPath) as! TitleTableViewCell
            
            cell.configure(with: section.title)
            
            return cell
        }
        
        switch section.type {
            
        case .hot:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrandingTableViewCell", for: indexPath) as!  TrandingTableViewCell
            
            cell.configure(with: section.hotItems)
            
            return cell
        
        case .stores:
            let cell = tableView.dequeueReusableCell(withIdentifier: "storesTableViewCell", for: indexPath) as! storesTableViewCell
            
            cell.configure(with: section.storeItems)
            
            return cell
            
        
        case .cards:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as! CardTableViewCell
            
            cell.configure(with: section.productItems)
            
            cell.didSelectCollectionItem = { [weak self] indexPath in

                guard let self = self else { return }

                let detailsVC = self.storyboard?.instantiateViewController(
                    withIdentifier: "SearchViewController"
                ) as! SearchViewController

                self.navigationController?.pushViewController(detailsVC, animated: true)
            }
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.row == 0 {
            return screenHeightFactor * 35
        }

        let section = ExploreDummyData.sections[indexPath.section]

        switch section.type {

        case .hot:
            return screenHeightFactor * 40

        case .stores:
            return screenHeightFactor * 70

        case .cards:
            return screenHeightFactor * 260
        }
    }
    
    @IBAction func filterPage(_ sender : UIButton){
        
        let filterVC = storyboard?.instantiateViewController(withIdentifier: "FilterViewController")as! FilterViewController
        
        filterVC.modalPresentationStyle = .overFullScreen
        filterVC.modalTransitionStyle = .crossDissolve
        
        
        present(filterVC, animated: true)
    }
    
}
