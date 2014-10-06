//
//  BetListSection.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation

struct BetListSection: Equatable {
  let title: String
  let items: [BetListItem] = []

  init(title: String, items: [BetListItem]) {
    self.title = title
    self.items = items
  }
}

func ==(left: BetListSection, right: BetListSection) -> Bool {
  return left.items == right.items
}
