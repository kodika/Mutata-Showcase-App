//
//  UIButtonDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit
import Foundation

final class UIButtonDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    @IBOutlet internal var onlyTextButton: UIButton!
    @IBOutlet internal var textAndIconButton: UIButton!
    @IBOutlet internal var onlyIconButton: UIButton!
    @IBOutlet internal var containerView1: UIView!
    @IBOutlet internal var containerView2: UIView!
    @IBOutlet internal var containerView3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Button"
        
        setupButtons()
        setupContainerViews()
    }
    
    private func setupButtons() {
        [onlyIconButton, onlyTextButton, textAndIconButton].forEach { (button) in
            button.layer.cornerRadius = 8
        }
        textAndIconButton.layer.borderWidth = 1
        textAndIconButton.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupContainerViews() {
        for containerView in [containerView1, containerView2, containerView3] {
            containerView?.layer.cornerRadius = 8
            containerView?.layer.shadowOffset = CGSize(width: 0, height: 1)
            containerView?.layer.shadowRadius = 14
            containerView?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
            containerView?.layer.shadowOpacity = 1
        }
    }
    
    //MARK: - IBAction
    @IBAction public func sharePressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Button pressed!", message: "Button is connected with @IBAction", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
