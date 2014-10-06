//
//  BetListData.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation

struct BetListData: Equatable {
  let sections: [BetListSection] = []

  init(sections: [BetListSection]) {
    self.sections = sections
  }
}

func ==(left: BetListData, right: BetListData) -> Bool {
  return left.sections == right.sections
}
