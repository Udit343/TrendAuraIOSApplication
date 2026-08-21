import UIKit

class InsightShowDataTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var visulaShowView: UIView!
    @IBOutlet weak var percentShowLabel: UILabel!
    @IBOutlet weak var outerView: UIView!

    private let progrssGradientLayer = CAGradientLayer()

    private var percentage: CGFloat = 0

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none

        title.font = UIFont.Outfit_Medium(size: 10.5)
        percentShowLabel.font = UIFont.Outfit_Medium(size: 10.5)

        setupProgressGradient()
    }

    private func setupProgressGradient() {

        progrssGradientLayer.colors = [
            UIColor(hex: "FFCC70").cgColor,
            UIColor(hex: "C850C0").cgColor,
            UIColor(hex: "4C57CF").cgColor
        ]

        progrssGradientLayer.startPoint = CGPoint(x: 1, y: 0)
        progrssGradientLayer.endPoint = CGPoint(x: 0, y: 1)

        visulaShowView.layer.insertSublayer(
            progrssGradientLayer,
            at: 0
        )
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let cornerRadius = 15 * screenHeightFactor

        
        visulaShowView.layer.cornerRadius = cornerRadius

        
        visulaShowView.applyGradientBorder(
            colors: [
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 2,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )

        updateProgressGradient(
            cornerRadius: cornerRadius
        )
    }

    private func updateProgressGradient(
        cornerRadius: CGFloat
    ) {

        let progressWidth =
            visulaShowView.bounds.width * percentage / 100

        progrssGradientLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: progressWidth,
            height: visulaShowView.bounds.height
        )

        progrssGradientLayer.cornerRadius = cornerRadius - 5
        progrssGradientLayer.masksToBounds = true
    }

    func configure(_ val: InsightShowDataVisual) {

        title.text = val.title
        percentShowLabel.text = val.percentage

        percentage = CGFloat(
            Double(
                val.percentage
                    .replacingOccurrences(of: "%", with: "")
            ) ?? 0
        )
    }
}
