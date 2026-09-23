import UIKit

class BlockedUserTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var blockedUserImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var blockedButton: UIButton!

    var onBlockedButtonTapped: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

        nameLabel.font = UIFont.Outfit_Medium(size: 14)
        subNameLabel.font = UIFont.Outfit_Light(size: 13)
        blockedButton.titleLabel?.font = UIFont.Outfit_Medium(size: 13)

        blockedButton.layer.cornerRadius = 13 * screenHeightFactor
        blockedButton.clipsToBounds = true

        selectionStyle = .none
        
        blockedUserImage.layer.cornerRadius = blockedUserImage.frame.height / 2
    }

    override func layoutSubviews() {
        super.layoutSubviews()

//        blockedButton.layer.sublayers?.removeAll {
//            $0.name == "GradientBorder" ||
//            $0.name == "GradientBackground"
//        }
    }

    @IBAction func userBlockedd(_ sender: UIButton) {
        onBlockedButtonTapped?()
        
        //print("Button Tapped")
    }

    func configure(with userData: BlockedUser) {

        nameLabel.text = userData.blockedToName
        blockedUserImage.loadImage(from: userData.profilePic, placeholder: UIImage(named: "blockedUser1"))
        //subNameLabel.text = userData.subname
        
        let username = userData.userName

                let attributedText = NSMutableAttributedString(
                    string: username
                )

                if username.count > 4 {
                    attributedText.addAttribute(
                        .foregroundColor,
                        value: UIColor.white,
                        range: NSRange(location: 0, length: 4)
                    )

                    attributedText.addAttribute(
                        .foregroundColor,
                        value: UIColor.white.withAlphaComponent(0.4),
                        range: NSRange(
                            location: 4,
                            length: username.count - 4
                        )
                    )
                }

                subNameLabel.attributedText = attributedText


        updateButtonUI(isBlocked: userData.isBlocked)
    }

    func updateButtonUI(isBlocked: Bool) {

        
        blockedButton.layer.sublayers?.removeAll {
            $0.name == "GradientBorder" ||
            $0.name == "GradientBackground"
        }

        
        blockedButton.applyGradientBorder(
            colors: [
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 2,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )

        if isBlocked {

            
            blockedButton.applyGradientBackground(
                colors: [
                    UIColor(hex: "FFCC70"),
                    UIColor(hex: "C850C0"),
                    UIColor(hex: "4C57CF")
                ],
                startPoint: CGPoint(x: 1, y: 0),
                endPoint: CGPoint(x: 0, y: 1)
            )

            blockedButton.setTitle("Unblock", for: .normal)

        } else {

            
            blockedButton.backgroundColor =
                UIColor.black.withAlphaComponent(0.2)

            blockedButton.setTitle("Block", for: .normal)
        }
    }
}
