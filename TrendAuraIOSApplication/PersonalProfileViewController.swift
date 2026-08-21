//  PersonalProfileViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 03/08/26.


import UIKit

class PersonalProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var titleLabel : UILabel!
    
    @IBOutlet weak var headerView : UIView!
    @IBOutlet weak var headerProfileImage : UIImageView!
    @IBOutlet weak var headerLessProfileImage : UIImageView!
    @IBOutlet weak var headerNmae : UILabel!
    
    @IBOutlet weak var saveButton : UIButton!
    @IBOutlet weak var addImageButton : UIButton!
    
    var profilevalidation = PersonalProfileValidation()
    
    var isImageSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        titleLabel.font = UIFont.Outfit_Medium(size: 22)
        headerNmae.font = UIFont.Outfit_Regular(size: 16)
        
        saveButton.titleLabel?.font = UIFont.Manrope_Bold(size: 15)
        saveButton.layer.cornerRadius = screenHeightFactor * 20
        
        //headerProfileImage.layer.cornerRadius = headerProfileImage.frame.height / 2
        
       // headerProfileImage.layer.masksToBounds = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let tap = UITapGestureRecognizer(
                target: self,
                action: #selector(hideKeyboard)
            )

            tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
        
        profilevalidation.links = Array(
                repeating: "",
                count: links.count
            )
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        saveButton.backgroundColor = .clear
        
        
        saveButton.applyGradientBorder(
            colors: [
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 2,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
        saveButton.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70").withAlphaComponent(0.2),
                    UIColor(hex: "C850C0").withAlphaComponent(0.2),
                    UIColor(hex: "4C57CF").withAlphaComponent(0.2)
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
        
        headerProfileImage.layer.cornerRadius = headerProfileImage.bounds.height / 2
            headerProfileImage.clipsToBounds = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //        guard let section = ProfileSection(rawValue: section) else {
        //            return 0
        //        }
        //
        //        switch section {
        //
        //        case .enterName:
        //            return 1
        //
        //        case .userName:
        //            return 1
        //
        //        case .about:
        //            return 1
        //
        //        case .state:
        //            return 1
        //
        //        case .city:
        //            return 1
        //
        //        case .visitLinks:
        //            return links.count
        //
        //        case .gender:
        //            return 1
        //
        //        case .dateOfBirth:
        //            return 1
        //        }
        
        guard let section = ProfileSection(rawValue: section) else {
            return 0
        }
        
        if section == .visitLinks {
            return links.count + 2
        }
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let section = ProfileSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileEditSectionTableViewCell", for: indexPath) as! ProfileEditSectionTableViewCell
            
            cell.configure(with: section.title)
            
            return cell
        }
        
        switch section {
            
            
        case .enterName:
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileEditNameTableViewCell",
                for: indexPath
            ) as! ProfileEditNameTableViewCell
            
            cell.configure(
                with: basicInfo.namePlaceholder,
                text: profilevalidation.name
            )
            
            cell.didChangedText = {[weak self] text in
                self?.profilevalidation.name = text
            }
            
            return cell
            
            
        case .userName:
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileEditNameTableViewCell",
                for: indexPath
            ) as! ProfileEditNameTableViewCell
            
            cell.configure(
                with: basicInfo.usernamePlaceholder,
                text: profilevalidation.username
            )
            
            cell.didChangedText  = {[weak self] text in
                self?.profilevalidation.username = text
            }
            
            return cell
            
        case .about:
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileEditAboutTableViewCell",
                for: indexPath
            ) as! ProfileEditAboutTableViewCell
            
            cell.textView.text = aboutInfo.placeholder
            
            cell.didChangedText = {[weak self] text in
                self?.profilevalidation.about = text
            }
            
            return cell
            
            
        case .state:
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileEditDropDownTableViewCell",
                for: indexPath
            ) as! ProfileEditDropDownTableViewCell
            
            cell.configure(
                with: locationInfo.states,
                placeholder: "Select State"
            )
            
            cell.didSelectItem = {[weak self] state in
                self?.profilevalidation.state = state
            }
            
            return cell
            
            
        case .city:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileEditDropDownTableViewCell",
                for: indexPath
            ) as! ProfileEditDropDownTableViewCell
            
            cell.configure(
                with: locationInfo.cities,
                placeholder: "Select cities"
            )
            
            cell.didSelectItem = {[weak self] city in
            
                self?.profilevalidation.city = city
            }
            
            return cell
            
            
            
        case .visitLinks:
            if indexPath.row == links.count + 1 {
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "ProfileEditAddLinkTableViewCell",
                    for: indexPath
                ) as! ProfileEditAddLinkTableViewCell
                
                cell.didTapAddField = {[weak self] in
                
                    self?.addNewLink()
                }

                return cell
            }

            let index = indexPath.row - 1
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileEditVisitLinksTableViewCell",
                for: indexPath
            ) as! ProfileEditVisitLinksTableViewCell

            cell.configure(
                   with: links[index],
                   text: profilevalidation.links[index]
               )
            
            cell.didChangeLink = { [weak self] text in
                    self?.profilevalidation.links[index] = text
                }

            return cell
            
            
        case .gender:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileEditDropDownTableViewCell",
                for: indexPath
            ) as! ProfileEditDropDownTableViewCell
            
            cell.configure(
                with: genderInfo.genders,
                placeholder: "Select Gender"
            )
            
            cell.didSelectItem = {[ weak self] gender in
            
                self?.profilevalidation.gender = gender
            }
            
            return cell
            
            
        case .dateOfBirth:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileEditNameTableViewCell",
                for: indexPath
            ) as! ProfileEditNameTableViewCell
            
            cell.configure(
                with: dobInfo.placeholder,
                text: profilevalidation.dob,
                isDatePicker: true
            )

//            cell.didSelectDate = { [weak self] date in
//                self?.profileValidation.dob = date
//            }
            
            cell.didSelectDate = {[weak self]  dateText in
            
                self?.profilevalidation.dob = dateText
            }
            
            return cell
            
        case .terms:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileEditTermsAndConditionTableViewCell", for: indexPath) as! ProfileEditTermsAndConditionTableViewCell
            
            cell.didChangedTerms = {[weak self] chenged in
                self?.profilevalidation.isTermsAccepted = chenged
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        guard let section = ProfileSection(rawValue: indexPath.section) else {
            return UITableView.automaticDimension
        }

        
        if indexPath.row == 0 {
            if section == .terms{
               return 0
           }
            return screenHeightFactor * 37
        }
        switch section {

        case .enterName:
            return screenHeightFactor * 40

        case .userName:
            return screenHeightFactor * 40

        case .about:
            return screenHeightFactor * 100

        case .state:
            return screenHeightFactor * 40

        case .city:
            return screenHeightFactor * 40

        case .visitLinks:

            
            if indexPath.row == links.count + 1 {
                return screenHeightFactor * 32
            }

            
            return screenHeightFactor * 45

        case .gender:
            return screenHeightFactor * 40

        case .dateOfBirth:
            return screenHeightFactor * 40
        
        case .terms:
            return screenHeightFactor * 60
        }
    }
    
    
    @IBAction func addImageButtonTapped(_ sender : UIButton){
              
        let alert = UIAlertController(
            title:"Select Image",
            message: "Choose an Option",
            preferredStyle: .actionSheet
        )
        
        let cameraBtn = UIAlertAction(title: "Camera", style: .default, handler: {_ in  self.openCamera()}
        )
        
        let libraryBtn = UIAlertAction(title: "open Library", style: .default, handler: {_ in self.openGallery()}
        )
        
        let cancelBtn = UIAlertAction(title: "Cancel",
                                      style: .cancel)
        
        alert.addAction(cameraBtn)
        alert.addAction(libraryBtn)
        alert.addAction(cancelBtn)
        
        self.present(alert, animated: true)
    }
    
    
    func openCamera() {

        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("Camera not available")
            return
        }

        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self

        present(picker, animated: true)
    }
    
    func openGallery(){
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[.originalImage] as? UIImage {

            headerProfileImage.image = image
            
            isImageSelected = true

            
            imageChnage()
        }

        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

        dismiss(animated: true)
    }
    
    func imageChnage(){
         
        //isImageSelected.toggle()
        
        if isImageSelected {
            headerLessProfileImage.image = UIImage(named: "addNewImage")
        }else{
            headerLessProfileImage.image = UIImage(named: "editImage")
        }
    }

    @IBAction func backPage(_ sender : UIButton){
             
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender : UIButton){
        
        view.endEditing(true)
        
        if validate() {
            print(profilevalidation)
            
            show_Alert(message: "Profile Changed")
        }
              
    }
    
    
     func validate()-> Bool {
        if profilevalidation.name.isBlank(){
            show_Alert(message: "Enter Name")
            return false
        }
        
        if profilevalidation.username.isBlank(){
            show_Alert(message: "Enter UserName")
            return false
        }
        
        if  profilevalidation.about.isBlank(){
            show_Alert(message: "Enter About")
            return false
        }
        
         if profilevalidation.state.isBlank(){
             show_Alert(message: "Select State")
             return false
         }
         
        if profilevalidation.city.isBlank(){
            show_Alert(message: "Select City")
            return false
        }
        
        if profilevalidation.gender.isBlank(){
            show_Alert(message: "Select Gender")
            return false
        }
        
        if profilevalidation.dob.isBlank(){
           show_Alert(message: "Select Date of Birth")
            return false
        }
         
         if !profilevalidation.isTermsAccepted{
             show_Alert(message: "Accept Term & Condition")
             return false
         }
         
         if !isImageSelected {

             show_Alert(message: "Please Select Profile Image")
             return false
         }
         
         //print("Links Count:", profilevalidation.links.count)
         //print(profilevalidation.links)
         
         for (index, link) in profilevalidation.links.enumerated() {

             let value = link.trimmingCharacters(in: .whitespacesAndNewlines)

             if value.isEmpty {
                 show_Alert(message: "Please enter Link \(index + 1)")
                 return false
             }

             if !value.isValidLinks() {
                 show_Alert(message: "Please enter a valid Link \(index + 1)")
                 return false
             }
         }
        
        return true
    }
    
    func addNewLink() {

        links.append(
            LinkInfo(
                imageName: "webLink",
                placeholder: "Website Link"
            )
        )

        profilevalidation.links.append("")

        tableView.reloadSections(
            IndexSet(integer: ProfileSection.visitLinks.rawValue),
            with: .automatic
        )
    }
    
    
}

