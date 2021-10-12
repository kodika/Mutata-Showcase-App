//
//  AppDelegate.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import Foundation
import UIKit
import FirebaseCore

@UIApplicationMain
open class AppDelegate: UIResponder, UIApplicationDelegate {
    
    final public var window: UIWindow?
    
    open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupFirebase()
    
        let viewControllers = [ListUIKitClassesViewController(), ListPluginClassesViewController(), FirebaseAuthenticationDemoViewController(), ApiDemoViewController()]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers.map({ (viewController) -> UINavigationController in
            let navController = UINavigationController(rootViewController: viewController)
            navController.navigationBar.barTintColor = UIColor(red: 242/255, green: 242/255, blue: 246/255, alpha: 1)
            return navController
        })
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.tintColor = UIColor.black
        tabBarController.tabBar.barTintColor = UIColor(red: 242/255, green: 242/255, blue: 246/255, alpha: 1)
        
        let normalAttributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Roboto-Regular", size: 10)!,
                                                               .foregroundColor: UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)]
        let selectedAttributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Roboto-Bold", size: 10)!,
                                                                 .foregroundColor: UIColor.black]
        let notSelectedTabbarImages = [UIImage(named: "notselecteduikiticon"),
                                       UIImage(named: "notselectedpluginicon"),
                                       UIImage(named: "notselectedfirebaseicon"),
                                       UIImage(named: "notselectedapiicon")]
        let selectedTabbarImages = [UIImage(named: "selecteduikiticon"),
                                    UIImage(named: "selectedpluginicon"),
                                    UIImage(named: "selectedfirebaseicon"),
                                    UIImage(named: "selectedapiicon")]
        
        for (index, tabBarItem) in tabBarController.tabBar.items!.enumerated() {
            tabBarItem.title = viewControllers[index].title
            
            tabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
            tabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
            
            tabBarItem.image = notSelectedTabbarImages[index]
            tabBarItem.selectedImage = selectedTabbarImages[index]
        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = tabBarController
        self.window!.makeKeyAndVisible()
        
        return true
    }
    
    open func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        NSLog("\(#function)")
    }
    
    public func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        NSLog("\(#function)")
    }
    
    public func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        NSLog("\(#function)")
    }
    
    public func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        NSLog("\(#function)")
    }
    
    public func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        NSLog("\(#function)")
    }
    
    private func setupFirebase() {
        #if !ANDROID
        let firebaseOptions = FirebaseOptions(contentsOfFile: Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")!)!
        FirebaseApp.configure(options: firebaseOptions)
        #endif
    }
}
