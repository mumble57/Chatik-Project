//
//  AppDelegate.swift
//  Chatik
//
//  Created by Hiii Power on 08.02.19.
//  Copyright © 2019 Hiii Power. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    enum States : String {
        case NotRunning = "Not running", Active = "Active", Inactive = "Inactive", Background = "Background"
    }
    
    enum LogState{
        case On
        case Off
    }
    
    var presentState = States.Background
    var previousState = States.Inactive
    
    //Turn logs on/off here
    var logState = LogState.Off
    //var logState = LogState.Off
    
    var output = String()
    func lifeCycle(previousState: String, presentState: String, methodName: String) -> String {
        switch logState {
        case .On:
            output = "Application moved from state " + previousState + " to state " + presentState + " : " + methodName
            return output
        case .Off:
            output = ""
            return output
        }
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        previousState = presentState
        presentState = .Active
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue, methodName: "didFinishLaunchingWithOptions"))
        
        return true

    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        previousState = presentState
        presentState = .Inactive
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue, methodName: "applicationWillResignActive"))
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        previousState = presentState
        presentState = .Background
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue, methodName: "applicationDidEnterBackground"))
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        previousState = presentState
        presentState = .Inactive
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue, methodName: "applicationWillEnterForeground"))

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
       // print(lifeCycle(previousState: "Background/Inactive", presentState: "Active", methodName: "applicationDidBecomeActive"))
        previousState = presentState
        presentState = .Active
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue, methodName: "applicationDidBecomeActive"))

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
       // print(lifeCycle(previousState: "Inactive/Active", presentState: "Not Running", methodName: "applicationDidBecomeActive"))
        previousState = presentState
        presentState = .Inactive
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue, methodName: "applicationWillTerminate"))
    }


}

