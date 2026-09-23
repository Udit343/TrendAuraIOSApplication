
import Foundation
import UIKit

class NonEditableTextField: UITextField {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }

    override func caretRect(for position: UITextPosition) -> CGRect {
        .zero
    }

    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        []   
    }
}
