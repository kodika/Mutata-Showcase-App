//
//  UIViewDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit

final class UIViewDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    @IBOutlet internal var containerView1: UIView!
    @IBOutlet internal var containerView2: UIView!
    @IBOutlet internal var containerView3: UIView!
    @IBOutlet internal var borderUIView: UIView!
    @IBOutlet internal var shadowUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "View"
        
        setupBorderUIView()
        setupShadowUIView()
        setupContainerViews()
    }
    
    private func setupBorderUIView() {
        self.borderUIView.layer.borderWidth = 3
        self.borderUIView.layer.borderColor = UIColor.red.cgColor
        self.borderUIView.layer.cornerRadius = 4
    }

    private func setupShadowUIView() {
        self.shadowUIView.layer.masksToBounds = false
        self.shadowUIView.layer.shadowColor = UIColor.red.cgColor
        self.shadowUIView.layer.shadowOffset.height = 2
        self.shadowUIView.layer.shadowOffset.width = 2
        self.shadowUIView.layer.shadowRadius = 6
        self.shadowUIView.layer.shadowOpacity = 1
    }
    
    private func setupContainerViews() {
        for containerView in [containerView1, containerView2, containerView3] {
            containerView?.layer.cornerRadius = 8
        }
    }
}
