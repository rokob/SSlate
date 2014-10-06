//
//  BetListViewInterface.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation

protocol BetListViewInterface {
  func showNoContentMessage()
  func showBetListData(data: BetListData)
  func reloadBets()
}