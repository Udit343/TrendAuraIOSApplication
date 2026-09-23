//  UploadVideoViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 14/09/26.

import UIKit
import AVFoundation

class UploadVideoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var uploadTitle : UILabel!
    @IBOutlet weak var freePlanOuterView : UIView!
    @IBOutlet weak var freePlanInnerView : UIView!
    @IBOutlet weak var freePlanImageView : UIImageView!
    @IBOutlet weak var freePlanLabel : UILabel!
    @IBOutlet weak var subscriptionOuterView : UIView!
    @IBOutlet weak var subscriptionInnerView : UIView!
    @IBOutlet weak var subscriptionimageView : UIImageView!
    @IBOutlet weak var subscriptionLabel : UILabel!
    
    @IBOutlet weak var uploadButton : UIButton!
    @IBOutlet weak var termsLable : UILabel!
    @IBOutlet weak var termsCheckBox : UIButton!
    
    @IBOutlet weak var tableView : UITableView!
    
    var selectedVideoIndexPath: IndexPath?
    
    var isAgree : Bool = true
    
    let viewModel = CreateReelViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadTitle.font = UIFont.Outfit_Medium(size: 14)

        freePlanLabel.font = UIFont.Manrope_SemiBold(size: 9)
        freePlanOuterView.layer.cornerRadius = 13 * screenHeightFactor
        freePlanOuterView.layer.borderWidth = 2
        freePlanOuterView.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        
        subscriptionLabel.font = UIFont.Outfit_Medium(size: 15)
        uploadButton.titleLabel?.font = UIFont.Outfit_SemiBold(size: 15)
        termsLable.font = UIFont.Outfit_Regular(size: 12)
        
        subscriptionOuterView.layer.cornerRadius = 12 * screenHeightFactor
        uploadButton.layer.cornerRadius = 15.5 * screenHeightFactor
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.onError = {[weak self] messaage in
            self?.show_Alert(message: messaage)
        }
        
        viewModel.onUploadSuccess = { [weak self] in
            self?.show_Alert(message: "Reel created successfully!")
            self?.navigationController?.popViewController(animated: true)
        }
        
        viewModel.onCategoriesLoded = {[weak self] in
        guard let self = self ,
              let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? UploadVideoTableViewCell else { return }
            cell.setCategories(self.viewModel.categories)
        }
        
        viewModel.fetchCategories()
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard)
        )
        
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        freePlanOuterView.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF"),
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
        
        uploadButton.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF"),
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
        
        
        subscriptionOuterView.applyGradientBorder(
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UploadVideoTableViewCell") as! UploadVideoTableViewCell
        
        cell.selectionStyle = .none
        
        cell.didUpdateLayout = { [weak tableView] in
            tableView?.performBatchUpdates(nil)
        }
        
        cell.onCollectionCellTap = { [weak self] collectionIndexPath in
            
            guard let self = self else { return }
            self.selectedVideoIndexPath = collectionIndexPath
            self.showVideoOptions()
        }
        
        cell.setCategories(viewModel.categories)
        
        return cell
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {



        guard let indexPath = selectedVideoIndexPath else {
            picker.dismiss(animated: true)
            return
        }

        let mediaType = info[.mediaType] as? String
        
        
        
        picker.dismiss(animated: true) { [weak self] in

            if mediaType == "public.movie", let videoURL = info[.mediaURL] as? URL {
                        
                self?.generateThumbnail(for: videoURL) { [weak self] thumbnail in
                            picker.dismiss(animated: true) {
                                guard let self = self, let thumbnail = thumbnail else { return }
                                self.updateVideoCell(at: indexPath, thumbnail: thumbnail, videoURL: videoURL)
                            }
                        }
                    } else if let image = info[.originalImage] as? UIImage {
                        
                        picker.dismiss(animated: true) { [weak self] in
                            self?.updateVideoCell(at: indexPath, image: image)
                        }
                    } else {
                        picker.dismiss(animated: true)
                    }
        }
    }
    
    
    private func generateThumbnail(for videoURL: URL, completion: @escaping (UIImage?) -> Void) {
           DispatchQueue.global(qos: .userInitiated).async {
               let asset = AVURLAsset(url: videoURL)
               let generator = AVAssetImageGenerator(asset: asset)
               generator.appliesPreferredTrackTransform = true

               let time = CMTime(seconds: 0.5, preferredTimescale: 600)
               do {
                   let cgImage = try generator.copyCGImage(at: time, actualTime: nil)
                   let thumbnail = UIImage(cgImage: cgImage)
                   DispatchQueue.main.async { completion(thumbnail) }
               } catch {
                   print("Thumbnail generation failed:", error)
                   DispatchQueue.main.async { completion(nil) }
               }
           }
       }
    
    private func updateVideoCell(at indexPath: IndexPath, thumbnail: UIImage, videoURL: URL) {
           guard let tableCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? UploadVideoTableViewCell,
                 let videoCell = tableCell.VideoCollectionView.cellForItem(at: indexPath) as? UploadVideoCollectionViewCell else {
               return
           }
           videoCell.setVideo(thumbnail: thumbnail, url: videoURL)
        videoCell.onRemoveMedia = { [weak self] in
            guard let self = self else { return }
            
            print("Media removed")
        }
       }
    
    
    private func updateVideoCell(at indexPath: IndexPath, image: UIImage) {
            guard let tableCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? UploadVideoTableViewCell,
                  let videoCell = tableCell.VideoCollectionView.cellForItem(at: indexPath) as? UploadVideoCollectionViewCell else {
                return
            }
            videoCell.setImage(image)
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 850 * screenHeightFactor
        
    }
    
    func showVideoOptions() {

        let alert = UIAlertController(
            title: "Select Video",
            message: "Choose an Option",
            preferredStyle: .actionSheet
        )

        let cameraBtn = UIAlertAction(
            title: "Camera",
            style: .default
        ) { [weak self] _ in
            self?.openCamera()
        }

        let libraryBtn = UIAlertAction(
            title: "Open Library",
            style: .default
        ) { [weak self] _ in
            self?.openGallery()
        }

        let cancelBtn = UIAlertAction(
            title: "Cancel",
            style: .cancel
        )

        alert.addAction(cameraBtn)
        alert.addAction(libraryBtn)
        alert.addAction(cancelBtn)

        present(alert, animated: true)
    }
    
    func openCamera() {
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                print("Camera not available")
                return
            }
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.mediaTypes = ["public.movie"]    
            picker.videoQuality = .typeMedium
            picker.delegate = self
            present(picker, animated: true)
        }
    
    func openGallery() {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.mediaTypes = ["public.movie"]
            picker.delegate = self
            present(picker, animated: true)
        }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

        dismiss(animated: true)
    }
    
    @IBAction func uploadButtonTapped(_ sender: UIButton) {
        
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? UploadVideoTableViewCell else { return }
        
        if let errorMessage = cell.validateFields() {
            show_Alert(title: "Validation Error", message: errorMessage)
            return
        }
        
        
        if let videoCell = cell.VideoCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? UploadVideoCollectionViewCell,
           let videoURL = videoCell.selectedVideoURL {
            print("Ready to upload video at:", videoURL)
        }
        guard let videoCell = cell.VideoCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? UploadVideoCollectionViewCell,
                  let videoURL = videoCell.selectedVideoURL,
                  let thumbnail = videoCell.addImage.image else {
                show_Alert(message: "Please select a video.")
                return
            }
        
        viewModel.submitReel(
            videoURL: videoURL,
            thumbnailImage: thumbnail,
            title: cell.commercialTextField.text ?? "",
            description: cell.descriptionTextView.text ?? "",
            visitLink: cell.visitLinkTextField.text ?? "",
            minPrice: cell.minPriceText.text ?? "",
            maxPrice: cell.maxPriceText.text ?? "",
            duration: getVideoDuration(for: videoURL),
            tags: cell.currentTags,
            selectedCategories: [cell.categoryTextField.text ?? ""],
            discount: "0",
            couponId: nil,
            couponExpiryDate: nil
        )
    }
    
    func getVideoDuration(for url: URL) -> String {
        let asset = AVURLAsset(url: url)
        let seconds = Int(CMTimeGetSeconds(asset.duration))
        let h = seconds / 3600
        let m = (seconds % 3600) / 60
        let s = seconds % 60
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
    
    @IBAction func agreeCheckButtonTapped(_ sender: UIButton) {

        isAgree.toggle()

        if isAgree {

            sender.setImage(
                UIImage(named: "Uncheck"),
                for: .normal
            )

        } else {

            sender.setImage(
                UIImage(named: "check1"),
                for: .normal
            )
        }
    }
    
    @IBAction func backScreen(_ sender : UIButton){
        navigationController?.popViewController(animated: true)
    }
}
