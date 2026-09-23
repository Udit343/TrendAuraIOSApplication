//  FilterViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 27/07/26.

import UIKit

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var innerView : UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var filterLabel : UILabel!
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var enterTextField: UITextField!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var bottomView : UIView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var applyButton: UIButton!
    
    @IBOutlet weak var tableView : UITableView!
    
    var ischeck = false
    
    let viewModel = FilterViewModel()   

        // lets Explore/Search receive the filtered results
        //var onFiltersApplied: (([ReelItem]) -> Void)?
    
    weak var hostNavigationController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterLabel.font = UIFont.Outfit_Medium(size: 20)
        textFieldView.layer.cornerRadius = screenHeightFactor * 8
        textFieldView.layer.borderWidth = 1
        textFieldView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.3).cgColor
        
        enterTextField.borderStyle = .none
        enterTextField.setPlaceholder(text: "Search…", color: UIColor(hex: "F3F4F8"), font: UIFont.Outfit_Regular(size: 12))
        
        resetButton.titleLabel?.font = UIFont.Outfit_Medium(size: 13)
        resetButton.layer.cornerRadius = screenHeightFactor * 14
        
        applyButton.titleLabel?.font = UIFont.Outfit_Medium(size: 13)
        applyButton.layer.borderWidth = 2
        applyButton.layer.borderColor = UIColor.white.cgColor
        applyButton.layer.cornerRadius = screenHeightFactor * 13
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(backgroundTapped)
        )
        view.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
        
        viewModel.onError = { [weak self] message in
            self?.show_Alert(message: message)
        }
        
        viewModel.onLoadingChanged = { [weak self] isLoading in
            self?.applyButton.isEnabled = !isLoading
        }
        
        viewModel.onFilterApplied = { [weak self] reels in
            guard let self = self else { return }
            
            let resultVC = self.storyboard?.instantiateViewController(
                withIdentifier: "FilterResultViewController"
            ) as! FilterResultViewController
            
            resultVC.reels = reels
            
            // Capture it into a local BEFORE dismiss — no ambiguity, no chain-walking
            let nav = self.hostNavigationController
            
            self.dismiss(animated: true) {
                //print(" nav at push time:", nav as Any)
                nav?.pushViewController(resultVC, animated: true)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        resetButton.applyGradientBorder(
                colors: [
                    UIColor(hex: "FBDA61"),
                    UIColor(hex: "FF5ACD")
                ])
        
        applyButton.applyGradientForButton(
            colors: [
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  allFilterSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allFilterSections[section].items.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSectionTableViewCell", for: indexPath) as! FilterSectionTableViewCell
            cell.configure(with: allFilterSections[indexPath.section].title)
            
            return cell
            
        }else if indexPath.section == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSliderTableViewCell", for: indexPath) as! FilterSliderTableViewCell
            
            return cell
            
        }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSubSectionTableViewCell", for: indexPath) as! FilterSubSectionTableViewCell
            
    cell.configure(with: allFilterSections[indexPath.section].items[indexPath.row - 1], isChecked: viewModel.isChecked(at: indexPath)
    )
        
        cell.onToggle = { [weak self] in
                    self?.viewModel.toggle(at: indexPath)
                    self?.tableView.reloadRows(at: [indexPath], with: .none)
        }

        return cell
    }
    
// this is the interface of tapgesture so not require for keyboard hiding anymore
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
    
    @IBAction func dismissedButton(_ sender : UIButton){
           dismiss(animated: true)
    }
    
    @IBAction func ResetButtonTapped(_ sender : UIButton){
        viewModel.resetAll()
        tableView.reloadData()
    }
    
    
    @IBAction func ApplyButtonTapped(_ sender : UIButton){
        viewModel.applyTapped()
    }
    
    @objc func backgroundTapped(_ sender : UITapGestureRecognizer){
        
        view.endEditing(true)
        let location  = sender.location(in: view)
        if !innerView.frame.contains(location){
            dismiss(animated: true)
        }
    }
}
