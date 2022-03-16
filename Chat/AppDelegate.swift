//
//  AppDelegate.swift
//  Chat
//
//  Created by Edgar Rico on 26/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigation = UINavigationController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        navigation.isNavigationBarHidden = true
        
        let x = HomeMain.createModule(navigation: navigation)
        
        navigation.pushViewController(x, animated: true)
        
        return true
    }

}

