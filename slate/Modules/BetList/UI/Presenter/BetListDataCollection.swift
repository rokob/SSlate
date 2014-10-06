//
//  BetListDataCollection.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation

class BetListDataCollection {
  enum BetSection {
    case Past
    case Current
    case Pending
  }

  var sections: [BetSection: [BetListItem]] = Dictionary()

  init() {}

  func addBets(bets: [Bet]) {
    for bet in bets {
      addBet(bet)
    }
  }

  func addBet(bet: Bet) {
    let item = itemWithBet(bet)
    let section = betSectionWithBet(bet)
    addBetListItem(item, section: section)
  }

  func betSectionWithBet(bet: Bet) -> BetSection {
    var calendar = NSCalendar.gregorianCalendar()
    var today = NSDate()
    let beforeToday = calendar.isDate(bet.event.date, beforeYearMonthDay: today)
    let pending = bet.status == Bet.Status.Pending

    if pending {
      return .Pending
    }
    if beforeToday {
      return .Past
    }
    return .Current
  }

  func addBetListItem(item: BetListItem, section: BetSection) {
    if var thisSection: [BetListItem] = sections[section] {
      thisSection.append(item)
      sections[section] = thisSection
    } else {
      var newSection: [BetListItem] = [item]
      sections[section] = newSection
    }
  }

  func itemWithBet(bet: Bet) -> BetListItem {
    return BetListItem(opponent: bet.opponent.name, bet: bet)
  }

  func collectedBetListData() -> BetListData {
    let sections = sortedBetListSections()
    return BetListData(sections: sections)
  }

  func sortedBetListSections() -> [BetListSection] {
    let keys = sortedBetSections()
    var betListSections: [BetListSection] = []

    for betSection in keys {
      if let itemList = sections[betSection] {
        var displaySection = displaySectionForBetSection(betSection)
        betListSections.append(displaySection)
      }
    }

    return betListSections
  }

  func sortedBetSections() -> [BetSection] {
    return [.Current, .Pending, .Past]
  }

  func displaySectionForBetSection(section: BetSection) -> BetListSection {
    let title = sectionTitleForBetSection(section)
    let items = sections[section]!

    return BetListSection(title: title, items: items)
  }

  func sectionTitleForBetSection(betSection: BetSection) -> String {
    switch betSection {
    case .Current:
      return "Current"
    case .Past:
      return "Past"
    case .Pending:
      return "Pending"
    }
  }
}
