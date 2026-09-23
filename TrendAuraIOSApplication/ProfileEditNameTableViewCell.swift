import UIKit

class ProfileEditNameTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var outerView: UIView!

    var didChangedText: ((String) -> Void)?
    var didSelectDate: ((String) -> Void)?

    private let datePicker = UIDatePicker()
    private var isDatePickerEnabled = false

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none

        outerView.layer.cornerRadius = screenHeightFactor * 16
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor

        nameTextField.font = UIFont.Outfit_Regular(size: 14)
        nameTextField.borderStyle = .none

        nameTextField.addTarget(
            self,
            action: #selector(textChanged),
            for: .editingChanged
        )
    }

    func configure(with placeholder: String,
                   text: String,
                   isDatePicker: Bool = false) {

        nameTextField.text = text

        nameTextField.setPlaceholder(
            text: placeholder,
            color: UIColor.white.withAlphaComponent(0.5),
            font: UIFont.Outfit_Regular(size: 14)
        )

        if isDatePicker {
            setupDatePicker(with: text)
        } else {
            nameTextField.inputView = nil
            nameTextField.inputAccessoryView = nil
        }
    }
    private func setupDatePicker(with existingValue : String) {

        datePicker.datePickerMode = .date

        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }

        datePicker.maximumDate = Date()
        
        if let existingDate = parseDate(existingValue) {
                datePicker.date = existingDate
            }

        nameTextField.inputView = datePicker

        datePicker.removeTarget(nil, action: nil, for: .allEvents)

        datePicker.addTarget(
            self,
            action: #selector(dateChanged),
            for: .valueChanged
        )

        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(doneTapped)
        )

        toolbar.items = [doneButton]

        nameTextField.inputAccessoryView = toolbar
    }
    
    private func parseDate(_ value: String) -> Date? {
        guard !value.isEmpty, value != "0000-00-00" else { return nil }

        let formats = ["dd/MM/yyyy", "yyyy-MM-dd", "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"]

        for format in formats {
            let formatter = DateFormatter()
            formatter.dateFormat = format
            formatter.timeZone = TimeZone(identifier: "UTC")
            if let date = formatter.date(from: value) {
                return date
            }
        }
        return nil
    }

    @objc func textChanged() {
        didChangedText?(nameTextField.text ?? "")
    }

    @objc func dateChanged() {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let date = formatter.string(from: datePicker.date)

        nameTextField.text = date
        didSelectDate?(date)
    }

    @objc func doneTapped() {
        nameTextField.resignFirstResponder()
    }
}
