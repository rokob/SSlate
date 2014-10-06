//
//  BetListInteractor.swift
//  slate
//
//  Created by Andy Ledvina on 9/25/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation

typealias SlateId = String

struct User: Equatable {
  let id: SlateId
  let name: String
  let image_url: NSURL
  let is_viewer_friend: Bool

  func is_viewer(viewer_id: SlateId) -> Bool {
    return id == viewer_id
  }
}

func ==(left: User, right: User) -> Bool {
  return left.id == right.id && left.name == right.name
}

struct Team: Equatable {
  let id: SlateId
  let name: String
  let short_name: String
  let image_url: NSURL
  let is_viewer_favorite: Bool
}

func ==(left: Team, right: Team) -> Bool {
  return left.id == right.id && left.name == right.name
}

struct Event: Equatable {
  let id: SlateId
  let date: NSDate
  let league: String
  let season: String
  let round: String
  let teams: [Team]
}

func ==(left: Event, right: Event) -> Bool {
  return left.id == right.id && left.date == right.date
    && left.teams == right.teams
}

struct Odds: Equatable {
  let favorite: SlateId
  let line: Float
  let spread: Float
  let ou: Float
}

func ==(left: Odds, right: Odds) -> Bool {
  return left.favorite == right.favorite
    && left.line == right.line
    && left.spread == right.spread
    && left.ou == right.ou
}

struct Wager: Equatable {
  let id: SlateId
  let viewer_pick: SlateId
  let opponent_pick: SlateId
  let amount: Int
  let unit: String
  let odds: Odds
}

func ==(left: Wager, right: Wager) -> Bool {
  return left.id == right.id && left.viewer_pick == right.viewer_pick
    && left.opponent_pick == right.opponent_pick
    && left.amount == right.amount
    && left.unit == right.unit
    && left.odds == right.odds
}

struct Bet: Equatable {
  enum Status: Int {
    case Pending = 0
    case Accepted, Locked, Finished
    case Dispute, Settled
  }

  let id: SlateId
  let status: Status
  let opponent: User
  let event: Event
  let wager: Wager
}

func ==(left: Bet, right: Bet) -> Bool {
  return left.id == right.id && left.status == right.status
    && left.opponent == right.opponent && left.event == right.event
    && left.wager == right.wager
}

protocol BetListInteractorInput {
  func findBets()
}

protocol BetListInteractorOutput {
  func foundBets(bets: [Bet])
}

class BetListDataManager {

}

class BetListInteractor: BetListInteractorInput {
  let dataManager: BetListDataManager
  var output: BetListInteractorOutput?
  var first: Bool = true

  init(dataManager: BetListDataManager) {
    self.dataManager = dataManager
  }

  func findBets() {
    let bearsPackers = [Team(id: "t12345", name: "Chicago Bears", short_name: "Bears", image_url: NSURL(string: ""), is_viewer_favorite: true),
      Team(id: "t54321", name: "Green Bay Packers", short_name: "Packers", image_url: NSURL(string: ""), is_viewer_favorite: false)
    ]
    let bets = [
      Bet(id: "b12345",
        status: .Pending,
        opponent: User(id: "u12345", name: "Lauren Gorecki", image_url: NSURL(string: ""), is_viewer_friend: true),
        event: Event(id: "e12345", date: NSDate(), league: "NFL", season: "Regular", round: "Week 4", teams: bearsPackers),
        wager: Wager(id: "w12345", viewer_pick: "Bears", opponent_pick: "", amount: 15.3, unit: "BIT", odds: Odds(favorite: "Bears", line: 100, spread: 100, ou: 100)))
    ]
    if first {
      first = false
      self.output?.foundBets(bets)
    } else {
      if let out = self.output {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
          out.foundBets(bets)
        })
      }
    }
  }

}