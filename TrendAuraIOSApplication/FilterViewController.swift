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
            
        cell.configure(with: allFilterSections[indexPath.section].items[indexPath.row-1])

            return cell
    }
    
// this is the interface of tapgesture so not require for keyboard hiding anymore
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
    
    @IBAction func dismissedButton(_ sender : UIButton){
           dismiss(animated: true)
    }
    
    
    @objc func backgroundTapped(_ sender : UITapGestureRecognizer){
        
        view.endEditing(true)

        
        let location  = sender.location(in: view)
        
        if !innerView.frame.contains(location){
            dismiss(animated: true)
        }
    }
}
