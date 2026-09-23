//  BlockedUserViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 12/08/26.

import UIKit

class BlockedUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var blockedUserLabel : UILabel!
    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var searchImage : UIImageView!
    @IBOutlet weak var searchTextField : UITextField!
    @IBOutlet weak var tableView : UITableView!
    
    
    
    let viewModel = BlockedUserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        blockedUserLabel.font = UIFont.Outfit_Medium(size: 22)
        searchTextField.setPlaceholder(text: "@jak", color: UIColor.white, font: UIFont.Outfit_Light(size: 14))
        
        searchTextField.borderStyle = .none
        searchView.layer.cornerRadius = 17.5 * screenHeightFactor
        
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.1).cgColor
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.onError = {[weak self] message in
            self?.show_Alert(message: message)
        }
        
        viewModel.onUserLoaded = {[weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.fetchAllUser()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.Users.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "BlockedUserTableViewCell",
            for: indexPath
        ) as! BlockedUserTableViewCell
        
        let user = viewModel.Users[indexPath.row]
        
        cell.configure(with: user)

        cell.onBlockedButtonTapped = { [weak self, weak cell] in
                    guard let self = self, let cell = cell else { return }

                    self.viewModel.toggleBlock(at: indexPath.row) { success in
                        DispatchQueue.main.async {
                            if success {
                                cell.updateButtonUI(isBlocked: self.viewModel.Users[indexPath.row].isBlocked)
                            }
                        }
                    }
                }


        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 65 * screenHeightFactor
        
    }
    
    @IBAction func backPage(_ sender : UIButton){
        
        navigationController?.popViewController(animated: true)
        
    }
}
