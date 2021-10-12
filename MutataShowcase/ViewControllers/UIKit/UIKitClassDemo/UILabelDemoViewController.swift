//
//  UILabelDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import Foundation
import UIKit

final class UILabelDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    @IBOutlet internal var containerView1: UIView!
    @IBOutlet internal var containerView2: UIView!
    @IBOutlet internal var containerView3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Label"
        
        setupContainerViews()
    }
    
    private func setupContainerViews() {
        for containerView in [containerView1, containerView2, containerView3] {
            containerView?.layer.cornerRadius = 8
        }
    }
}
