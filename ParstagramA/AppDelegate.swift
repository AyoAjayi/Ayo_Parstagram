//
//  AppDelegate.swift
//  ParstagramA
//
//  Created by Ayo  on 2/29/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit
import Parse

//Error happening:libc++abi.dylib: terminating with uncaught exception of type NSException



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        
        Parse.initialize(
                  with: ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) -> Void in
                      configuration.applicationId = "PastagramA"
                      configuration.server = "https://fast-tundra-18008.herokuapp.com/parse"
                  })
              )
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

