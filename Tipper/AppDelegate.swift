//
//  AppDelegate.swift
//  Tipper
//
//  Created by Joshua Escribano on 9/22/16.
//  Copyright © 2016 Joshua Escribano. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        checkLaunchDate(application)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        checkLaunchDate(application)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func checkLaunchDate(_ application: UIApplication) {
        let defaults = UserDefaults.standard
        let lastDate = defaults.object(forKey: "LastLaunchDate") as? TimeInterval
        if (lastDate != nil) {
            let vc = application.keyWindow?.rootViewController?.childViewControllers[0] as? TipViewController
            let currentTime = NSDate.timeIntervalSinceReferenceDate
            // Reset bill amount if too much time has elasped
            // at 10 minutes currently
            if lastDate!.distance(to: currentTime) > 60 * 10.0 {
                defaults.removeObject(forKey: "BillAmount")
                let currencySymbol = Locale.current.currencySymbol ?? "$"
                vc?.billField.text = ""
                vc?.tipLabel.text = "\(currencySymbol)0.00"
                vc?.totalLabel.text = "\(currencySymbol)0.00"
            }
            vc?.billField.becomeFirstResponder()
        }
        defaults.set(NSDate.timeIntervalSinceReferenceDate, forKey: "LastLaunchDate")
        defaults.synchronize()
    }


}

