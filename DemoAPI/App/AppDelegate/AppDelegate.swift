//
//  AppDelegate.swift
//  DemoAPI
//
//  Created by Linh NGUYEN on 11/15/19.
//  Copyright © 2019 Linh NGUYEN. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let winesVC = WinesViewController(nibName: "WinesViewController", bundle: nil)
        let rootNAV = UINavigationController(rootViewController: winesVC)
        window.rootViewController = rootNAV
        self.window = window
        self.window?.makeKeyAndVisible()
        return true
    }

}

