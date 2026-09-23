//  UploadVideoCollectionViewCell.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 15/09/26.


import UIKit
class UploadVideoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var innerView : UIView!
    @IBOutlet weak var addImage : UIImageView!
    @IBOutlet weak var uploadImageView : UIImageView!
    @IBOutlet weak var addCoverLabel : UILabel!
    @IBOutlet weak var imageRemoveButton : UIButton!
    
    private(set) var selectedVideoURL: URL?
    
    var onRemoveMedia : (()->Void)?
    
    private lazy var playIconView: UIImageView = {
            let iv = UIImageView(image: UIImage(systemName: "play.circle.fill"))
            iv.tintColor = .white
            iv.contentMode = .scaleAspectFit
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.isHidden = true
            iv.isUserInteractionEnabled = false
            return iv
        }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addCoverLabel.font = UIFont.Outfit_Medium(size: 11)
        outerView.layer.cornerRadius = 8 * screenHeightFactor
        
        outerView.clipsToBounds = true
        
        addImage.contentMode = .scaleAspectFill
        addImage.clipsToBounds = true
        
        imageRemoveButton.isHidden = true
        
        outerView.addSubview(playIconView)
                NSLayoutConstraint.activate([
                    playIconView.centerXAnchor.constraint(equalTo: outerView.centerXAnchor),
                    playIconView.centerYAnchor.constraint(equalTo: outerView.centerYAnchor),
                    playIconView.widthAnchor.constraint(equalToConstant: 28 * screenHeightFactor),
                    playIconView.heightAnchor.constraint(equalToConstant: 28 * screenHeightFactor)
                ])
                outerView.bringSubviewToFront(playIconView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        outerView.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 1.5,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
    }
    
    func setImage(_ image: UIImage) {
            addImage.image = image
            innerView.isHidden = true
            playIconView.isHidden = true
            selectedVideoURL = nil
            imageRemoveButton.isHidden = false
    }
   
    
    func setVideo(thumbnail: UIImage, url: URL) {
            addImage.image = thumbnail
            innerView.isHidden = true
            playIconView.isHidden = false
            selectedVideoURL = url
            imageRemoveButton.isHidden = false
    }
    
    
    
    func removeMedia() {
        addImage.image = nil
        innerView.isHidden = false
        playIconView.isHidden = true
        selectedVideoURL = nil
        imageRemoveButton.isHidden = true
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            addImage.image = nil
            innerView.isHidden = false
            playIconView.isHidden = true
            selectedVideoURL = nil
           imageRemoveButton.isHidden = true
    }

    
    @IBAction func removeButtonTapped(_ sender: UIButton) {
        removeMedia()
        onRemoveMedia?()
    }
    

}

