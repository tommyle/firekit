//
//  AppDelegate.swift
//  firekit
//
//  Created by Tommy Le on 2018-11-30.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBarViewController = UITabBarController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.applicationSupportsShakeToEdit = false

        let activityFeedViewController = ActivityFeedViewController()
        let activityTab = UITabBarItem.init(title: "Home", image: UIImage.init(named: "home"), selectedImage: UIImage.init(named: "homeFilled"))
        activityFeedViewController.tabBarItem = activityTab

        let chatListViewController = ChatListViewController()
        let searchTab = UITabBarItem.init(title: "Messages", image: UIImage.init(named: "comment"), selectedImage: UIImage.init(named: "commentFilled"))
        chatListViewController.tabBarItem = searchTab

        let notificationsViewController = NotificationsViewController()
        let notificationsTab = UITabBarItem.init(title: "Activity", image: UIImage.init(named: "like"), selectedImage: UIImage.init(named: "likeFilled"))
        notificationsViewController.tabBarItem = notificationsTab

        let profileViewController = ProfileViewController()
        let profileTab = UITabBarItem.init(title: "Profile", image: UIImage.init(named: "profile"), selectedImage: UIImage.init(named: "profileFilled"))
        profileViewController.tabBarItem = profileTab

        UITabBar.appearance().tintColor = UIColor.nero
        UITabBar.appearance().unselectedItemTintColor = UIColor.nero

        self.tabBarViewController.viewControllers = [UINavigationController.init(rootViewController: activityFeedViewController),
                                                UINavigationController.init(rootViewController: chatListViewController),
                                                UINavigationController.init(rootViewController: notificationsViewController),
                                                UINavigationController.init(rootViewController: profileViewController)]

        window?.rootViewController = tabBarViewController

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
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}
