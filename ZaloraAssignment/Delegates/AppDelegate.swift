//
//  AppDelegate.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/2/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit
import Swifter
import SwiftyBeaver

let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Logger().setupLogger()
        configureTheme()
        
        _ = FunctionalHelper.getDocumentsDirectory()
        log.info("ZaloraAssignment loaded")
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            let callbackUrl = URL(string: APP_URL_SCHEME)!
            Swifter.handleOpenURL(url, callbackURL: callbackUrl)
           return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

// setup theme color
extension AppDelegate {
    func configureTheme() {
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1764705882, green: 0.662745098, blue: 0.9921568627, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

