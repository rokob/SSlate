//
//  BetListPresenter.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation

class BetListPresenter: BetListInteractorOutput, BetListModuleInterface {
  var listInteractor: BetListInteractorInput?
  var userInterface: BetListViewInterface?
  var listWireframe: BetListWireframe?

  init() {}

  func updateView() {
    listInteractor?.findBets()
  }

  func foundBets(bets: [Bet]) {
    if bets.count == 0 {
      userInterface?.showNoContentMessage()
    } else {
      updateUserInterfaceWithBets(bets)
    }
  }

  func updateUserInterfaceWithBets(bets: [Bet]) {
    let betListData = betListDataWithBets(bets)
    userInterface?.showBetListData(betListData)
  }

  func betListDataWithBets(bets: [Bet]) -> BetListData {
    let collection = BetListDataCollection()
    collection.addBets(bets)
    return collection.collectedBetListData()
  }

  func createNewBet() {
    listWireframe?.presentCreateInterface()
  }
}
