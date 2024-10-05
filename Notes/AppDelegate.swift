//
//  AppDelegate.swift
//  Notes
//
//  Created by Kushang  on 05/10/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navVc = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.navigation()
        return true
    }
    
    func navigation() {
//        self.window = UIWindow(frame: UIScreen.main.bounds)
        //let nav1 = UINavigationController()
        let mainView = ViewController(nibName: nil, bundle: nil)
        navVc.viewControllers = [mainView]
        self.window!.rootViewController = navVc
        self.window?.makeKeyAndVisible()
    }
}

