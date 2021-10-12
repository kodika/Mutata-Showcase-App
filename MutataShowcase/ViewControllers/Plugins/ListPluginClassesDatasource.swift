//
//  ListPluginClassesDatasource.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import Foundation
import UIKit

public class ListPluginClassesDatasource {
    
    private let pluginClasses: [GeneralClass]
    
    public init() {
        self.pluginClasses = [
            GeneralClass(name: "Lottie Animation View", nickname: "Lottie", imageName: "lottieicon", uiViewControllerClass: LottieDemoViewController.self),
            GeneralClass(name: "MBProgressHUD", nickname: "Progress HUD", imageName: "spinnericon", uiViewControllerClass: MBProgressHUDViewController.self),
            GeneralClass(name: "YouTubePlayerView", nickname: "YouTube Player View", imageName: "ytplayericon", uiViewControllerClass: YTPlayerViewDemoViewController.self),
            GeneralClass(name: "Contacts", nickname: "Contacts", imageName: "contactsicon", uiViewControllerClass: CNContactsDemoViewController.self)
        ]
    }
    
    public func numberOfUIKitClasses() -> Int {
        return self.pluginClasses.count
    }
    
    public func pluginClass(atIndex index: Int) -> GeneralClass {
        return self.pluginClasses[index]
    }
}
