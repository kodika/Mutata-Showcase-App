//
//  UITextFieldDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit
import Foundation

final class UITextFieldDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {
    
    private let borderStyles = [UITextField.BorderStyle.roundedRect,
                                UITextField.BorderStyle.bezel,
                                UITextField.BorderStyle.line,
                                UITextField.BorderStyle.none]
    @IBOutlet internal var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Text Field"
     
        tableView.register(UINib(nibName: "UITextFieldDemoCell", bundle: nil), forCellReuseIdentifier: "UITextFieldDemoCell")
    }
    
    #if !ANDROID //Keyboard in Android has specific button to dismiss it
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    #endif
}

//MARK: - UITableViewDataSource
extension UITextFieldDemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return borderStyles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITextFieldDemoCell", for: indexPath) as! UITextFieldDemoCell
        cell.borderStyle = borderStyles[indexPath.row]
        
        return cell
    }
}
