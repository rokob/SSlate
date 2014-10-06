//
//  BetListItem.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation

struct BetListItem: Equatable, Printable {

  let opponent: String
  let homeImageURL: NSURL
  let awayImageURL: NSURL
  let eventTitle: String
  let eventDate: String
  let favorite: String
  let odds: String
  let wager: String
  let viewerPick: String

  init(opponent: String, bet: Bet) {
    let event = bet.event
    let wager = bet.wager

    self.opponent = opponent

    if (event.teams.count > 0) {
      self.homeImageURL = event.teams[0].image_url
    } else {
      self.homeImageURL = NSURL(string: "")
    }

    if (event.teams.count > 1) {
      self.awayImageURL = event.teams[1].image_url
    } else {
      self.awayImageURL = NSURL(string: "")
    }

    self.eventTitle = BetListItem.makeEventTitle(event)
    self.eventDate = BetListItem.makeEventDate(event)
    self.favorite = "Favorite: \(wager.odds.favorite)"
    self.odds = BetListItem.makeOddsString(wager.odds)
    self.wager = "Wager: \(wager.amount) \(wager.unit)"
    self.viewerPick = "Your pick: \(wager.viewer_pick)"
  }

  var description: String {
    get {
      return "\(opponent) -- \(eventTitle) -- \(eventDate)"
    }
  }

  static func makeEventTitle(event: Event) -> String {
    if (event.teams.count > 1) {
      return "\(event.teams[0].short_name) vs \(event.teams[1].short_name)"
    } else if (event.teams.count > 0) {
      return "\(event.teams[0].short_name)"
    } else {
      return ""
    }
  }

  static func makeEventDate(event: Event) -> String {
    return NSDateFormatter.localizedStringFromDate(event.date, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
  }

  static func makeOddsString(odds: Odds) -> String {
    return "Odds: \(odds.line)"
  }
}

func ==(left: BetListItem, right: BetListItem) -> Bool {
  return left.opponent == right.opponent
    && left.eventTitle == right.eventTitle
    && left.eventDate == right.eventDate
}
