//
//  ListUIKitClassesDatasource.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import Foundation
import UIKit

class ListUIKitClassesDatasource {
    
    private let uiKitClasses: [GeneralClass]
    
    public init() {
        self.uiKitClasses = [
            GeneralClass(name: "UIView", nickname: "View", imageName: "viewicon", uiViewControllerClass: UIViewDemoViewController.self),
            GeneralClass(name: "UIImageView", nickname: "Image View", imageName: "imageviewicon", uiViewControllerClass: UIImageViewDemoViewController.self),
            GeneralClass(name: "UILabel", nickname: "Label", imageName: "labelicon", uiViewControllerClass: UILabelDemoViewController.self),
            GeneralClass(name: "UITextField", nickname: "Text Field", imageName: "textfieldicon", uiViewControllerClass: UITextFieldDemoViewController.self),
            GeneralClass(name: "UITextView", nickname: "Text View", imageName: "textviewicon", uiViewControllerClass: UITextViewDemoViewController.self),
            GeneralClass(name: "UIButton", nickname: "Button", imageName: "buttonicon", uiViewControllerClass: UIButtonDemoViewController.self),
            GeneralClass(name: "UISegmentedControl", nickname: "Segmented Control", imageName: "segmentedcontrolicon", uiViewControllerClass: UISegmentedControlDemoViewController.self),
            GeneralClass(name: "UISwitch", nickname: "Switch", imageName: "switchicon", uiViewControllerClass: UISwitchDemoViewController.self),
            GeneralClass(name: "UIActivityViewController", nickname: "Activity Screen", imageName: "shareicon", uiViewControllerClass: UIActivityViewControllerDemoViewController.self),
            GeneralClass(name: "UIAlertController", nickname: "Alert Screen", imageName: "alertcontrollericon", uiViewControllerClass: UIAlertControllerDemoViewController.self),
            GeneralClass(name: "UIImagePickerController", nickname: "Image Picker Screen", imageName: "cameraicon", uiViewControllerClass: UIImagePickerControllerDemoViewController.self)
        ]
    }
    
    public func numberOfUIKitClasses() -> Int {
        return self.uiKitClasses.count
    }
    
    public func uiKitClass(atIndex index: Int) -> GeneralClass {
        return self.uiKitClasses[index]
    }
}
