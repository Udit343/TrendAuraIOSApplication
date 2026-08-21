//  SubCriptionViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 11/08/26.

import UIKit

class SubCriptionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {

    
    
    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var BackGroundImageView : UIImageView!
    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var headingLabel : UILabel!
    @IBOutlet weak var subHeadingLabel : UILabel!
    @IBOutlet weak var myPlanView : UIView!
    @IBOutlet weak var myplanImage : UIImageView!
    @IBOutlet weak var activePlanView : UIView!
    @IBOutlet weak var activeplandotImage : UIImageView!
    @IBOutlet weak var activePlanLabel : UILabel!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var cardView : UIView!
    @IBOutlet weak var cardTitleLabel : UILabel!
    @IBOutlet weak var cardSubtitleLabel : UILabel!
    @IBOutlet weak var cardLineView : UIView!
    @IBOutlet weak var nextPaymentLabel : UILabel!
    @IBOutlet weak var paymentMethodLabel : UILabel!
    @IBOutlet weak var totalLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var cardNumberLabel : UILabel!
    @IBOutlet weak var cardAmountLabel : UILabel!
    @IBOutlet weak var cardLogoImageView : UIImageView!
    @IBOutlet weak var lineView : UIView!
    @IBOutlet weak var cancelButton : UIButton!
    @IBOutlet weak var managePlanButton : UIButton!
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var startLabel : UILabel!
    
    
    
    
    @IBOutlet weak var linksView : UIView!
    @IBOutlet weak var linksImageView : UIImageView!
    @IBOutlet weak var titleLinkLabel : UILabel!
    @IBOutlet weak var  linkCardView : UIView!
    @IBOutlet weak var  cardInnerView : UIView!
    @IBOutlet weak var  linkCountImage : UIImageView!
    @IBOutlet weak var linkCountLabel : UILabel!
    @IBOutlet weak var  cardLinkTitle : UILabel!
    @IBOutlet weak var cardLinkSubTitle : UILabel!
    @IBOutlet weak var cardLinkline : UIView!
    @IBOutlet weak var paymentMethodLinkLabel : UILabel!
    @IBOutlet weak var estimatedAmount : UILabel!
    @IBOutlet weak var masterCardLink : UIImageView!
    @IBOutlet weak var starLinkLabel : UILabel!
    @IBOutlet weak var  estimatedAmountNumber : UILabel!
    @IBOutlet weak var linkline : UIView!
    @IBOutlet weak var managePlanLinkButton : UIButton!
    @IBOutlet weak var cardDigitlink : UILabel!
    
    
    @IBOutlet  weak var tableView : UITableView!
    @IBOutlet  weak var paymentHistoryView : UIView!
    @IBOutlet  weak var searchView : UIView!
    @IBOutlet  weak var searchImage : UIImageView!
    @IBOutlet  weak var searchTextField : UITextField!
    
    
    let allCategorySubCription = ["My Plan","Links Cicked","Payment History"]
    
    var selectedIndex = 0;
    
    var selectCategory : allCategory = .myPlan
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        headingLabel.font = UIFont.Outfit_Medium(size: 23)
        subHeadingLabel.font = UIFont.Outfit_Regular(size: 13)
        activePlanLabel.font = UIFont.Outfit_Medium(size: 11)
        
        titleLabel.font = UIFont.Outfit_SemiBold(size: 24)
        
        cardTitleLabel.font = UIFont.Outfit_Medium(size: 18)
        cardSubtitleLabel.font = UIFont.Outfit_Light(size: 9.5)
        
        nextPaymentLabel.font = UIFont.Outfit_Regular(size: 12)
        dateLabel.font = UIFont.Outfit_Medium(size: 12)
        
        
        paymentMethodLabel.font = UIFont.Outfit_Medium(size: 12)
        cardNumberLabel.font = UIFont.Outfit_Medium(size: 12)
        
        totalLabel.font = UIFont.Outfit_Medium(size: 12)
        cardAmountLabel.font = UIFont.Outfit_Medium(size: 12)
        
        cancelButton.titleLabel?.font = UIFont.Outfit_Regular(size: 14)
        managePlanButton.titleLabel?.font = UIFont.Outfit_Regular(size: 14)
        
        collectionView.delegate = self
        collectionView.dataSource = self
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                    layout.minimumInteritemSpacing = 8
                    layout.minimumLineSpacing = 8
            }
        
        managePlanButton.layer.borderWidth = 1
        managePlanButton.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        
        cardView.layer.cornerRadius = 10 * screenHeightFactor
        
        cancelButton.layer.cornerRadius = 14 * screenHeightFactor
        managePlanButton.layer.cornerRadius = 13.5 * screenHeightFactor
        
        
        titleLinkLabel.font = UIFont.Outfit_SemiBold(size: 24)
        linkCountLabel.font = UIFont.Outfit_SemiBold(size: 14)
        cardLinkTitle.font = UIFont.Outfit_Medium(size: 18)
        cardLinkSubTitle.font = UIFont.Outfit_Light(size: 9.5)
        paymentMethodLinkLabel.font = UIFont.Outfit_Regular(size: 13)
        estimatedAmount.font = UIFont.Outfit_Regular(size: 13)
        estimatedAmountNumber.font = UIFont.Outfit_Regular(size: 13)
        cardDigitlink.font = UIFont.Outfit_Regular(size: 13)
        
        managePlanLinkButton.titleLabel?.font = UIFont.Outfit_Medium(size: 14)
        managePlanLinkButton.layer.borderWidth = 1
        managePlanLinkButton.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        managePlanLinkButton.layer.cornerRadius = 15.5 * screenHeightFactor
        
        linkCardView.layer.cornerRadius = 10.5 * screenHeightFactor
        cardInnerView.layer.cornerRadius = 8 * screenHeightFactor
        
        tableView.delegate = self
        tableView.dataSource  = self
        
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha:0.1 ).cgColor
        searchView.layer.cornerRadius = 18 * screenHeightFactor
        
        searchTextField.borderStyle = .none
        searchTextField.setPlaceholder(text: "Search", color: UIColor.white, font: UIFont.Outfit_Light(size: 14))
        
        updateScreen()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        activePlanView.layer.cornerRadius = 5 * screenHeightFactor
        activePlanView.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF")
        ],
            startPoint: CGPointMake(1, 0),
            endPoint: CGPointMake(0, 1)
        
        )
        
        cardView.applyGradientBorder(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF")
        ],
            borderWidth: 2,
            startPoint: CGPointMake(1, 0),
            endPoint: CGPointMake(0, 1)
        )
        
        cancelButton.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 2,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
        
        managePlanButton.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF")
        ],
            startPoint: CGPointMake(1, 0),
            endPoint: CGPointMake(0, 1)
        )
        
        managePlanLinkButton.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF")
        ],
            startPoint: CGPointMake(1, 0),
            endPoint: CGPointMake(0, 1)
        )
        
        linkCardView.applyGradientBorder(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF")
        ],
            borderWidth: 2,
            startPoint: CGPointMake(1, 0),
            endPoint: CGPointMake(0, 1)
        )
        
        cardInnerView.applyGradientBorder(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF")
        ],
            borderWidth: 2,
            startPoint: CGPointMake(1, 0),
            endPoint: CGPointMake(0, 1)
        )
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCriptionTableViewCell", for: indexPath) as! SubCriptionTableViewCell
        
        cell.paymentHistory(with: allHistory[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 75 * screenHeightFactor
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return allCategorySubCription.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCriptionCollectionViewCell", for: indexPath) as! SubCriptionCollectionViewCell
        
        cell.category(with: allCategorySubCription[indexPath.item])
        
        cell.updateUI(isSelected: selectedIndex == indexPath.item)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            selectCategory = .myPlan
        case 1:
            selectCategory = .LinkCicked
        case 2:
            selectCategory = .PayMentHistory
        default:
            break
        }
        
        updateScreen()
        
        selectedIndex = indexPath.item
        
        collectionView.reloadData()
    }
    
    
    func updateScreen(){
        
        myPlanView.isHidden = true
        linksView.isHidden = true
        paymentHistoryView.isHidden = true
        
        switch selectCategory {
        case .myPlan:
            myPlanView.isHidden = false
        case .LinkCicked:
            linksView.isHidden = false
        case .PayMentHistory:
            paymentHistoryView.isHidden = false
        }
        
    }
    
    @IBAction func backPage(_ sender : UIButton){
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
