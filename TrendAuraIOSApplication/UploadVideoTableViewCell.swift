//  UploadVideoTableViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 15/09/2

import UIKit

class UploadVideoTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var OuterView : UIView!
    
    @IBOutlet weak var coverLabel : UILabel!
    
    @IBOutlet weak var VideoCollectionView : UICollectionView!
    
    @IBOutlet weak var commercialLabel : UILabel!
    @IBOutlet weak var commercialView : UIView!
    @IBOutlet weak var commercialTextField : UITextField!
    
    @IBOutlet weak var descriptionLabel :UILabel!
    @IBOutlet weak var descriptionView : UIView!
    @IBOutlet weak var descriptionTextView : UITextView!
    
    @IBOutlet weak var  categoryLabel : UILabel!
    @IBOutlet weak var  categoryView : UIView!
    @IBOutlet weak var  categoryTextField : UITextField!
    
    @IBOutlet weak var tagLabel : UILabel!
    @IBOutlet weak var tagView : UIView!
    @IBOutlet weak var tagTextField : UITextField!
    @IBOutlet weak var enterButton : UIButton!
    
    @IBOutlet weak var tagCollectionView : UICollectionView!
    
    @IBOutlet weak var visitLinkLabel : UILabel!
    @IBOutlet weak var visitLinkView : UIView!
    @IBOutlet weak var visitLinkTextField : UITextField!
    
    @IBOutlet weak var agreeCheckButton : UIButton!
    @IBOutlet weak var agreeLabel : UILabel!
    
    @IBOutlet weak var listPriceLabel : UILabel!
    @IBOutlet weak var minPriceView : UIView!
    @IBOutlet weak var minPriceText : UITextField!
    
    @IBOutlet weak var toLabel : UILabel!
    
    @IBOutlet weak var maxPriceView : UIView!
    @IBOutlet weak var maxPriceText : UITextField!
    
    @IBOutlet weak var discountCheck : UIButton!
    @IBOutlet weak var discountCheckLabel : UILabel!
    @IBOutlet weak var discountLable : UILabel!
    
    @IBOutlet weak var dropDownButton : UIButton!
    
    
    
    private var tagCollectionViewToVisitLinkConstraint: NSLayoutConstraint?
    private var tagViewToVisitLinkConstraint: NSLayoutConstraint?
    
    
    var isAgreeSelected = true
    
    var isAgreeSelectedDiscount = true
    
    var didTextChanged : ((String)->Void)?
    
    private let categoryPicker = UIPickerView()
    
    var didUpdateLayout : (()->Void)?
    
    private var tags : [String] = []
    
    var currentTags: [String] { tags }
    
    
    var onCollectionCellTap: ((IndexPath) -> Void)?
    
    
    
    private var categories : [ReelCategory] = []
    
    
    private let tagHorizontalPadding: CGFloat = 54
    private let tagCellHeight: CGFloat = 23 * screenHeightFactor
    private let tagFont = UIFont.Outfit_Light(size: 13)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryTextField.isUserInteractionEnabled = true
        categoryTextField.delegate = self
        categoryTextField.tintColor = .clear 
        
        let radious = 17 * screenHeightFactor
        
        coverLabel.font = UIFont.Outfit_Medium(size: 14)
        
        commercialLabel.font = UIFont.Outfit_Medium(size:14)
        commercialView.layer.borderWidth = 1
        commercialView.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        commercialView.layer.cornerRadius = radious
        commercialTextField.setPlaceholder(text: "Enter title here", color: UIColor.white.withAlphaComponent(0.5) , font: UIFont.Outfit_Regular(size: 13))
        commercialTextField.borderStyle = .none
        
        
        descriptionLabel.font = UIFont.Outfit_Medium(size: 14)
        descriptionView.layer.borderWidth = 1
        descriptionView.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        descriptionView.layer.cornerRadius = 10 * screenHeightFactor
        descriptionTextView.font = UIFont.Outfit_Medium(size: 13)
        
        
        categoryLabel.font = UIFont.Outfit_Medium(size: 14)
        categoryView.layer.cornerRadius = radious
        categoryView.layer.borderWidth = 1
        categoryView.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        categoryTextField.setPlaceholder(text: "Select Category ", color: UIColor.white , font: UIFont.Outfit_Regular(size: 13))
        categoryTextField.borderStyle = .none
        
        
    tagLabel.font = UIFont.Outfit_Medium(size: 14)
        tagView.layer.cornerRadius = radious
        tagView.layer.borderWidth = 1
        tagView.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        tagTextField.setPlaceholder(text: "Enter title here", color: UIColor.white.withAlphaComponent(0.5) , font: UIFont.Outfit_Regular(size: 13))
        tagTextField.borderStyle = .none
        
        
        enterButton.layer.cornerRadius = 15 * screenHeightFactor
        enterButton.titleLabel?.font = UIFont.Manrope_SemiBold(size: 12)
        
        visitLinkLabel.font = UIFont.Outfit_Medium(size: 14)
        visitLinkView.layer.borderWidth = 1
        visitLinkView.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        visitLinkView.layer.cornerRadius = radious
        visitLinkTextField.setPlaceholder(text: "Enter url", color: UIColor.white.withAlphaComponent(0.5) , font: UIFont.Outfit_Regular(size: 13))
        visitLinkTextField.borderStyle = .none
        
        
        agreeLabel.font = UIFont.Outfit_Medium(size: 11)
        
        listPriceLabel.font = UIFont.Outfit_Medium(size: 14)
        
        minPriceView.layer.cornerRadius = radious
        minPriceView.layer.borderWidth = 1
        minPriceView.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        minPriceText.setPlaceholder(text: "$0", color: UIColor.white.withAlphaComponent(0.5) , font: UIFont.Outfit_Regular(size: 13))
        minPriceText.borderStyle = .none
        
        maxPriceView.layer.cornerRadius = radious
        maxPriceView.layer.borderWidth = 1
        maxPriceView.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        maxPriceText.setPlaceholder(text: "$150", color: UIColor.white.withAlphaComponent(0.5) , font: UIFont.Outfit_Regular(size: 13))
        maxPriceText.borderStyle = .none
        
        toLabel.font = UIFont.Outfit_Medium(size: 14)
        
        discountLable.font = UIFont.Outfit_Medium(size: 14)
        
        discountCheckLabel.font = UIFont.Outfit_Regular(size: 11)
        
        VideoCollectionView.delegate = self
        VideoCollectionView.dataSource = self
        
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        tagCollectionView.isHidden = true
        
        enterButton.addTarget(self
                              , action: #selector(EnterButtonTapped), for: .touchUpInside)
        
        descriptionTextView.delegate = self
        
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        categoryTextField.inputView = categoryPicker
        
        
        descriptionTextView.text = "Your description here..."
        descriptionTextView.textColor = UIColor.white.withAlphaComponent(0.5)
        
        if let layout = tagCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.estimatedItemSize = .zero
                layout.minimumInteritemSpacing = 5
                layout.minimumLineSpacing = 5
            layout.scrollDirection = .horizontal
        }
        
        setupTagSectionConstraints()
        updateTagSectionVisibility()
        
    }
    
    @objc func EnterButtonTapped(){
        guard let text = tagTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else { return}
        
        tags.append(text)
            tagTextField.text = ""

            tagCollectionView.reloadData()
            updateTagSectionVisibility()
            didUpdateLayout?()
    }
    
    private func removeTag(cell: UploadVideoAddTagCollectionViewCell) {
        guard let indexPath = tagCollectionView.indexPath(for: cell) else { return }

        
        tags.remove(at: indexPath.item)

            tagCollectionView.reloadData()
            updateTagSectionVisibility()
            didUpdateLayout?()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        enterButton.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 1,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
    }
    
    private var isShowingDescriptionPlaceholder = true

    
    func configure(with text: String) {
        let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedText.isEmpty {
            
            descriptionTextView.text = "Your description here..."
            descriptionTextView.textColor = UIColor.white.withAlphaComponent(0.5)
            isShowingDescriptionPlaceholder = true
            
        } else {
            
            descriptionTextView.text = text
            descriptionTextView.textColor = .white
            isShowingDescriptionPlaceholder = false
        }
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if isShowingDescriptionPlaceholder {
            
            textView.text = ""
            textView.textColor = .white
            isShowingDescriptionPlaceholder = false
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        
        didTextChanged?(textView.text)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            
            textView.text = "Your description here..."
            textView.textColor = UIColor.white.withAlphaComponent(0.5)
            isShowingDescriptionPlaceholder = true
            didTextChanged?("")
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == VideoCollectionView {
            return 1
        }
        
        return tags.count
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func setCategories(_ categories : [ReelCategory]){
        self.categories = categories
        categoryPicker.reloadAllComponents()
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("Category number", categories.count)
        return categories.count
        
    }

    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        return categories[row].name
    }

    func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {
        
        categoryTextField.text = categories[row].name
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == VideoCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UploadVideoCollectionViewCell", for: indexPath) as! UploadVideoCollectionViewCell
            
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UploadVideoAddTagCollectionViewCell", for: indexPath) as! UploadVideoAddTagCollectionViewCell
        
        cell.configure(with : tags[indexPath.item])
        
        cell.onRemoveTapped = {[weak self , weak cell] in
            guard let self = self ,
                  let cell = cell else { return }
            self.removeTag(cell: cell)
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == VideoCollectionView {
            return CGSize(
                width: 0.32 * VideoCollectionView.frame.width ,
                height: VideoCollectionView.frame.height
            )
        }
        
        let text = tags[indexPath.item]
            let textWidth = (text as NSString)
                .size(withAttributes: [.font: tagFont])
                .width

            let cellWidth = ceil(textWidth) + tagHorizontalPadding
            return CGSize(width: cellWidth, height: tagCellHeight)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {

        if collectionView == VideoCollectionView {
            onCollectionCellTap?(indexPath)
        }
    }
    
    
    
    @IBAction func ShowDropDown(_ sender : UIButton){
        categoryTextField.becomeFirstResponder()
    }
    
    @IBAction func agreeCheckButtonTapped(_ sender: UIButton) {

        isAgreeSelected.toggle()

        if isAgreeSelected {

            sender.setImage(
                UIImage(named: "check1"),
                for: .normal
            )

        } else {

            sender.setImage(
                UIImage(named: "Uncheck"),
                for: .normal
            )
        }
    }
    
    @IBAction func DiscountCheckButtonTapped(_ sender: UIButton) {

        isAgreeSelectedDiscount.toggle()

        if isAgreeSelectedDiscount {

            sender.setImage(
                UIImage(named: "check1"),
                for: .normal
            )

        } else {

            sender.setImage(
                UIImage(named: "Uncheck"),
                for: .normal
            )
        }
    }
    
    func validateFields() -> String? {

        guard let videoCell = VideoCollectionView.cellForItem(
            at: IndexPath(item: 0, section: 0)
        ) as? UploadVideoCollectionViewCell else {
            return "Please select a video."
        }

        guard videoCell.selectedVideoURL != nil else {
            return "Please select a video."
        }

        
        guard let commercialText = commercialTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !commercialText.isEmpty else {
            return "Please enter commercial title."
        }

        guard commercialText.count >= 3 else {
            return "Commercial title must be at least 3 characters."
        }

        guard commercialText.count <= 60 else {
            return "Commercial title must not exceed 60 characters."
        }


        let titleRegex = "^[a-zA-Z0-9 &,.!?'\\-]+$"
        guard commercialText.range(of: titleRegex, options: .regularExpression) != nil else {
            return "Commercial title contains invalid characters."
        }

        
        let description = descriptionTextView.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        guard !description.isEmpty, description != "Your description here..." else {
            return "Please enter your description."
        }

        guard description.count >= 10 else {
            return "Description must be at least 10 characters."
        }

        guard description.count <= 500 else {
            return "Description must not exceed 500 characters."
        }


        let descriptionRegex = "^[a-zA-Z &,.!?'\\-\\n]+$"
        guard description.range(of: descriptionRegex, options: .regularExpression) != nil else {
            return "Description contains invalid characters."
        }

        
        guard !categoryTextField.isEmpty() else {
            return "Please select a category."
        }

        
        guard !tags.isEmpty else {
            return "Please add at least one tag."
        }

        
        guard let urlText = visitLinkTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !urlText.isEmpty else {
            return "Please enter visit link."
        }

        guard let url = URL(string: urlText),
              let scheme = url.scheme?.lowercased(),
              ["http", "https"].contains(scheme),
              let host = url.host, !host.isEmpty else {
            return "Please enter a valid URL."
        }

        
        guard let minPriceRaw = minPriceText.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !minPriceRaw.isEmpty else {
            return "Please enter minimum price."
        }


        let priceRegex = "^[0-9]+(\\.[0-9]{1,2})?$"
        guard minPriceRaw.range(of: priceRegex, options: .regularExpression) != nil,
              let minimumPrice = Double(minPriceRaw) else {
            return "Please enter a valid minimum price."
        }

        guard minimumPrice >= 0 else {
            return "Minimum price cannot be negative."
        }

        
        guard let maxPriceRaw = maxPriceText.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !maxPriceRaw.isEmpty else {
            return "Please enter maximum price."
        }

        guard maxPriceRaw.range(of: priceRegex, options: .regularExpression) != nil,
              let maximumPrice = Double(maxPriceRaw) else {
            return "Please enter a valid maximum price."
        }

        guard maximumPrice >= 0 else {
            return "Maximum price cannot be negative."
        }

        guard minimumPrice <= maximumPrice else {
            return "Maximum price must be greater than or equal to minimum price."
        }

        
        guard isAgreeSelected else {
            return "Please accept Terms & Conditions."
        }

        return nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if textField == categoryTextField {
            return false
        }
        return true
    }
    
    
    private func setupTagSectionConstraints() {
        
        let Viewspacing = contentView.frame.height * 0.037
        let collectionViewSpacing = contentView.frame.height * 0.02
        
        tagCollectionView.translatesAutoresizingMaskIntoConstraints = false
        visitLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        tagView.translatesAutoresizingMaskIntoConstraints = false

        tagCollectionViewToVisitLinkConstraint = tagCollectionView.bottomAnchor.constraint(
            equalTo: visitLinkLabel.topAnchor, constant: -collectionViewSpacing
        )

        tagViewToVisitLinkConstraint = tagView.bottomAnchor.constraint(
            equalTo: visitLinkLabel.topAnchor, constant: -Viewspacing
        )
    }

    private func updateTagSectionVisibility() {
        let hidden = tags.isEmpty

        tagCollectionView.isHidden = hidden
        tagCollectionViewToVisitLinkConstraint?.isActive = !hidden
        tagViewToVisitLinkConstraint?.isActive = hidden
    }
}

