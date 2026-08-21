//  ProfilePageViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 31/07/26.

import UIKit

class ProfilePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate ,UIGestureRecognizerDelegate{
    
    

    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var dismissButton : UIButton!
    @IBOutlet weak var settingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.isUserInteractionEnabled = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        settingLabel.font = UIFont.Outfit_Medium(size: 18)
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(backgroundTapped))

        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  profileInfoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePageTableViewCell", for: indexPath) as! ProfilePageTableViewCell
        
        cell.configure(with: profileInfoData[indexPath.row] )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let personalVc = storyboard?.instantiateViewController(identifier: "PersonalProfileViewController") as! PersonalProfileViewController
            
            navigationController?.pushViewController(personalVc, animated: true)
            
        }else if indexPath.row == 2{
            
            let subsCriptionVC = storyboard?.instantiateViewController(identifier: "SubCriptionViewController") as! SubCriptionViewController
            
            navigationController?.pushViewController(subsCriptionVC, animated: true)
            
        }else if indexPath.row == 3 {
            
            let contactUsPage = storyboard?.instantiateViewController(identifier: "ContactUsViewController") as! ContactUsViewController
            
            navigationController?.pushViewController(contactUsPage, animated: true)
            
        }else if indexPath.row == 5{
            let blockedUsers = storyboard?.instantiateViewController(identifier: "BlockedUserViewController") as! BlockedUserViewController
            
            navigationController?.pushViewController(blockedUsers, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return screenHeightFactor * 60
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldReceive touch: UITouch) -> Bool {

        let point = touch.location(in: view)

        if backgroundImage.frame.contains(point) {
            return false
        }
        return true
    }
    
    @objc func backgroundTapped(_ sender : UITapGestureRecognizer){
          
        view.endEditing(true)
        dismiss(animated: true)
    }
    
    @IBAction func dismissButton(_ sender : UIButton){
              dismiss(animated: true)
    }
}
