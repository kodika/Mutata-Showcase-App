//
//  UIAlertControllerDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit
import Foundation

final class UIAlertControllerDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {
    
    //MARK: - IBOutlet
    @IBOutlet internal var presentAlertWithOneActionButton: UIButton!
    @IBOutlet internal var presentActionSheetAlertWithTwoActionsButton: UIButton!
    @IBOutlet internal var containerView1: UIView!
    @IBOutlet internal var containerView2: UIView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Alert Screen"
        
        setupButtons()
        setupContainerViews()
    }
    
    private func setupButtons() {
        [presentAlertWithOneActionButton, presentActionSheetAlertWithTwoActionsButton].forEach { (button) in
            button?.layer.cornerRadius = 8
        }
    }
    
    private func setupContainerViews() {
        for containerView in [containerView1, containerView2] {
            containerView?.layer.masksToBounds = false
            containerView?.layer.cornerRadius = 8
            containerView?.layer.shadowOffset = CGSize(width: 0, height: 1)
            containerView?.layer.shadowRadius = 14
            containerView?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
            containerView?.layer.shadowOpacity = 1
        }
    }

    @IBAction internal func presentAlertWithOneActionPressed(_ sender: Any) {
        let alertVC = UIAlertController(title: "Alert Controller Title", message: "Alert Controller Message", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Custom Title", style: .cancel, handler: nil))
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction internal func presentActionSheetAlertWithTwoActionsPressed(_ sender: Any) {
        let alertVC = UIAlertController(title: "Alert Controller Title", message: "Alert Controller Message", preferredStyle: .actionSheet)
        alertVC.addAction(UIAlertAction(title: "First Title", style: .default, handler: nil))
        alertVC.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        
        self.present(alertVC, animated: true, completion: nil)
    }
}
