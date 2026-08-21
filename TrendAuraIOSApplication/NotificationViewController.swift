//  NotificationViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 12/08/26.

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var notificationTitle : UILabel!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var backGroundImage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationTitle.font = UIFont.Outfit_Medium(size: 22)
    
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allNotificationData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  allNotificationData[section].allCard.count + 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationDayTableViewCell", for: indexPath) as! NotificationDayTableViewCell
            cell.configure(allNotificationData[indexPath.section].title)
            
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCardTableViewCell", for: indexPath) as! NotificationCardTableViewCell
        
        cell.configure(with: allNotificationData[indexPath.section].allCard[indexPath.row-1])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
                return 40 * screenHeightFactor
        }else{
            return 80 * screenHeightFactor
        }
    }
    
    @IBAction func backButton(_ sender : UIButton){
        
        navigationController?.popViewController(animated: true)
        
    }
}
