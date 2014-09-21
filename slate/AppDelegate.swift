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

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)

    var rootVC = ViewController()

    self.window!.rootViewController = rootVC

    self.window!.backgroundColor = UIColor.whiteColor()
    self.window!.makeKeyAndVisible()

    return true
  }

}

