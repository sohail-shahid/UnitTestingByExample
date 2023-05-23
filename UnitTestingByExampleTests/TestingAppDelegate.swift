//
//  TestingAppDelegate.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 23/05/2023.
//

import UIKit

@objc (TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        debugPrint("<< Launching with testing app delegate")
        return true
    }
}
