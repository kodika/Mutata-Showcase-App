//
//  MBProgressHUDViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import Foundation
import UIKit
import MBProgressHUD

final class MBProgressHUDViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Progress HUD"
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            #if ANDROID
            DispatchQueue.runOnUiThread {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            #else
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            #endif
        }
    }
}
