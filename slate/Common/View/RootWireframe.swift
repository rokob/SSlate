//
//  RootWireframe.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation
import UIKit

class RootWireframe {
  func showRootViewController(viewController: UIViewController, inWindow: UIWindow) {
    let navigationController = navigationControllerFromWindow(inWindow)
    navigationController.viewControllers = [viewController]
  }

  func navigationControllerFromWindow(window: UIWindow) -> UINavigationController {
    let navigationController = window.rootViewController as UINavigationController
    return navigationController
  }
}