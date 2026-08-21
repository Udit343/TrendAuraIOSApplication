//  InsightViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 18/08/26.

import UIKit

class InsightViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var insightTitle : UILabel!
    @IBOutlet weak var horizontalLineView : UIView!
    @IBOutlet weak var headerView : UIView!
    @IBOutlet weak var headerImage : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var subNameLabel : UILabel!
    @IBOutlet weak var nameImage : UIImageView!
    @IBOutlet weak var headerThubImageView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var backgrounImageView : UIImageView!
    @IBOutlet weak var dividerView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insightTitle.font = UIFont.Outfit_Medium(size: 18)
        nameLabel.font = UIFont.Outfit_SemiBold(size: 22)
        subNameLabel.font = UIFont.Outfit_Medium(size: 14)
        titleLabel.font = UIFont.Manrope_Bold(size: 20)
        descriptionLabel.font = UIFont.Manrope_Light(size: 10)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return insightData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let data  = insightData[section]
        
        if section == 0 {
            return data.insightOptions!.count 
            
        }
        return data.insightShowDataVisual!.count + 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InsightOptionsTableViewCell") as! InsightOptionsTableViewCell
            
            cell.configure((insightData[0].insightOptions?[indexPath.row])!)
            
            return cell
            
        }else if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InsightTitleTableViewCell", for: indexPath) as! InsightTitleTableViewCell
            
            
            if let title = insightData[indexPath.section].insightTitle {

                           cell.configure(title)

                           cell.onselection = { [weak self] selectedIndex in

                               guard let self = self else { return }

                               print("Section:", indexPath.section)
                               print("Selected index:", selectedIndex)

                               self.handleSelection(
                                   section: indexPath.section,
                                   selectedIndex: selectedIndex
                               )
                           }
                
                
            }
            
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InsightShowDataTableViewCell", for: indexPath) as! InsightShowDataTableViewCell
            
            cell.configure((insightData[indexPath.section].insightShowDataVisual?[indexPath.row-1])!)
            
            return cell
        }
    }
    
    
    private func handleSelection(section: Int,
                                 selectedIndex: Int){
        
            print("Section: \(section)")
            print("Selected Index: \(selectedIndex)")
    
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 50 * screenHeightFactor
            
        }
        
        if indexPath.row == 0{
            return 70 * screenHeightFactor
        }
        
        return 35 * screenHeightFactor
    }
}
