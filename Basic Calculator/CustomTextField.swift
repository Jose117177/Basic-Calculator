import SwiftUI
import UIKit

struct CustomTextField: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField

        init(parent: CustomTextField) {
            self.parent = parent
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }

            // Updated text after the change
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

            // Debugging
            print("Current Text: \(currentText)")
            print("Updated Text: \(updatedText)")

            // Check if the length of updatedText is within the limit
            if updatedText.count <= 3 {
                // Update the parent binding with the new text
                parent.text = updatedText
                return true
            } else {
                return false
            }
        }
    }

    @Binding var text: String
    var placeholder: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.delegate = context.coordinator
        textField.inputView = UIView() // Disable system keyboard
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}

