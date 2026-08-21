import UIKit

class InsightSubSectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!

    private var isSelect = false

    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.font = UIFont.Manrope_Medium(size: 10.5)

        outerView.layer.cornerRadius = 10.7 * screenHeightFactor
        outerView.clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        updateUI()
    }

    private func updateUI() {

        
        outerView.layer.sublayers?.removeAll {
            $0.name == "GradientBorder" ||
            $0.name == "GradientBackground"
        }

        if isSelect {

            
            outerView.applyGradientBackground(
                colors: [
                    UIColor(hex: "FFCC70"),
                    UIColor(hex: "C850C0"),
                    UIColor(hex: "4C57CF")
                ],
                startPoint: CGPoint(x: 1, y: 0),
                endPoint: CGPoint(x: 0, y: 1)
            )

            outerView.layer.borderWidth = 2

            outerView.layer.borderColor =
                UIColor.white.withAlphaComponent(0.5).cgColor

        } else {

            
            outerView.layer.borderWidth = 0
            outerView.layer.borderColor = nil

            
            outerView.backgroundColor = .clear
        }
    }

    func configure(_ title: String, isSelected: Bool) {

        titleLabel.text = title

        
        isSelect = isSelected

        
        updateUI()
    }
}
