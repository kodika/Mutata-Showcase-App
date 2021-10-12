//
//  UITextViewDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit

final class UITextViewDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    @IBOutlet internal var whiteExampleContainerView: UIView!
    @IBOutlet internal var blackExampleContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Text View"
        
        setupContainerViews()
    }

    private func setupContainerViews() {
        for containerView in [whiteExampleContainerView, blackExampleContainerView] {
            containerView?.layer.cornerRadius = 8
        }
    }
    
    #if !ANDROID //Keyboard in Android has specific button to dismiss it
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    #endif
}
