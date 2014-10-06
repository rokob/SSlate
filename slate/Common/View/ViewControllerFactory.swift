//
//  ViewControllerFactory.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerFactory {
  class func viewControllerWithIdentifier(identifier: String) -> UIViewController? {
    switch identifier {
    case BetListViewControllerIdentifier:
      return BetListViewController()
    default:
      return nil
    }
  }
}