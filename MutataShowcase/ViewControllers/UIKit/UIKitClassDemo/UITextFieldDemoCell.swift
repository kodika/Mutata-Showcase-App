//
//  UITextFieldDemoCell.swift
//  MutataShowcase
//
//  Created by Kodika.io on 1/10/21.
//

import UIKit

class UITextFieldDemoCell: UITableViewCell {

    public var borderStyle: UITextField.BorderStyle! {
        didSet {
            textField.borderStyle = borderStyle
            switch borderStyle! {
            case .none:
                textField.backgroundColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
                titleLabel.text = "Text Field with background and no lines"
                textField.text = "This is a Text Field"
            case .line:
                textField.backgroundColor = UIColor.white
                titleLabel.text = "Text Field with line corners"
                textField.placeholder = "This is a placeholder"
            case .bezel:
                textField.backgroundColor = UIColor.white
                titleLabel.text = "Text Field with bezel corners"
                textField.text = "No Placeholder"
            case .roundedRect:
                textField.backgroundColor = UIColor.white
                titleLabel.text = "Text Field with rounded corners"
                textField.text = "This is a Text Field"
            }
        }
    }
    @IBOutlet internal var titleLabel: UILabel!
    @IBOutlet internal var textField: UITextField!
    @IBOutlet internal var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        #if !ANDROID
        textField.delegate = self
        #endif
        containerView.layer.cornerRadius = 8
    }
}

//MARK: - UITextFieldDelegate
#if !ANDROID //Keyboard in Android has specific button to dismiss it
extension UITextFieldDemoCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
#endif
