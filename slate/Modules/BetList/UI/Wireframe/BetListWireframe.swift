//
//  BetListWireframe.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation
import UIKit

class BetListWireframe: NSObject {
  var listPresenter: BetListPresenter?
  var rootWireframe: RootWireframe?
  var betListViewController: BetListViewController?

  func presentBetListInterfaceFromWindow(window: UIWindow) {
    if let viewController = ViewControllerFactory.viewControllerWithIdentifier(BetListViewControllerIdentifier) {
      let betListViewController = viewController as BetListViewController
      betListViewController.eventHandler = listPresenter
      listPresenter!.userInterface = betListViewController
      rootWireframe?.showRootViewController(betListViewController, inWindow: window)
    }
  }

  func presentCreateInterface() {
    // TODO
  }
}