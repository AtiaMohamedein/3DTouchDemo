//
//  AppDelegate.swift
//  3DTouchDemo
//
//  Created by Attia Mo on 11/7/17.
//  Copyright © 2017 Attia Mo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        var isLaunchedFromQuickAction = false
        
        // Check if it's launched from Quick Action
        if (launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem) != nil {
            
            isLaunchedFromQuickAction = true
            // Handle the sortcutItem
            //handleQuickAction(shortcutItem)
        }
        
        return !isLaunchedFromQuickAction
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
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - Shortcut Item Handling.
    @available(iOS 9, *)
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        completionHandler(handleQuickAction(shortcutItem))
        
    }
    
    enum Shortcut: String {
        case checkOffers = "CheckOffers"
        case searchProduct = "SearchProducts"
        
    }
    
    func handleQuickAction(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        
        var quickActionHandled = false
        
        let type = shortcutItem.type.components(separatedBy: ".").last!
        
        let navigationController = self.window!.rootViewController as! UINavigationController
        let vc = navigationController.visibleViewController as! ViewController
        
        if let shortcutType = Shortcut.init(rawValue: type) {
            switch shortcutType {
                
            case .checkOffers:
                
                // Handle your offers event here
                print("Offers ")
                vc.title = "Offers"
                
                quickActionHandled = true
                
            case .searchProduct:
                
                // Handle your Search event here

                print("Search !")
                vc.title = "Search For Product!"

                quickActionHandled = true
            }
        }
        
        return quickActionHandled
    }
    
}

