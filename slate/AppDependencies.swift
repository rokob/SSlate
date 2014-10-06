//
//  AppDependencies.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
  var betListWireframe = BetListWireframe()

  init() {
    configureDependencies()
  }

  func installRootViewControllerIntoWindow(window: UIWindow) {
    betListWireframe.presentBetListInterfaceFromWindow(window)
  }

  func configureDependencies() {
    let rootWireframe = RootWireframe()

    let betListPresenter = BetListPresenter()
    let betDataManager = BetListDataManager()
    let betListInteractor = BetListInteractor(dataManager: betDataManager)

    betListInteractor.output = betListPresenter

    betListPresenter.listInteractor = betListInteractor
    betListPresenter.listWireframe = betListWireframe

    betListWireframe.listPresenter = betListPresenter
    betListWireframe.rootWireframe = rootWireframe
  }
}