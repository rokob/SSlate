//
//  AppDelegate.swift
//  slate
//
//  Created by Andy Ledvina on 9/20/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  let appDependencies = AppDependencies()

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)

    let rootNavController = RootNavigationController()
    self.window!.rootViewController = rootNavController

    appDependencies.installRootViewControllerIntoWindow(window!)

    self.window!.backgroundColor = UIColor.whiteColor()
    self.window!.makeKeyAndVisible()

    return true
  }

}

