//
//  UIActivityViewControllerDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit
import Foundation

final class UIActivityViewControllerDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    //MARK: - IBOutlets
    @IBOutlet internal var shareTextButton: UIButton!
    @IBOutlet internal var containerView: UIView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Share"

        shareTextButton.layer.cornerRadius = 8
        setupContainerView()
    }
    
    private func setupContainerView() {
        containerView.layer.masksToBounds = false
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowRadius = 14
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        containerView.layer.shadowOpacity = 1
    }
    
    //MARK: - IBActions
    @IBAction internal func shareTextButtonPressed(_ sender: Any) {
        let uiActivityViewController = UIActivityViewController(activityItems: ["Run native Swift iOS apps on Android! Visit https://mutata.io"], applicationActivities: nil)
        self.present(uiActivityViewController, animated: true, completion: nil)
    }
}
