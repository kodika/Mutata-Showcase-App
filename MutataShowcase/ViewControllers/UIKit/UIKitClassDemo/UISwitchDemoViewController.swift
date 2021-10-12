//
//  UISwitchDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit

final class UISwitchDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    @IBOutlet internal var containerView1: UIView!
    @IBOutlet internal var containerView2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Switch"
        
        setupContainerViews()
    }

    private func setupContainerViews() {
        for containerView in [containerView1, containerView2] {
            containerView?.layer.cornerRadius = 8
        }
    }
}
