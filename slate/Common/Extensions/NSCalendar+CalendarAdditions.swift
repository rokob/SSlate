//
//  NSCalendar+CalendarAdditions.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import Foundation

extension NSCalendar {
  class func gregorianCalendar() -> NSCalendar {
    return NSCalendar(calendarIdentifier: NSGregorianCalendar)
  }

  func isDate(date: NSDate, beforeYearMonthDay: NSDate) -> Bool {
    let comparison = compareYearMonthDay(date, toYearMonthDay: beforeYearMonthDay)
    let result = comparison == NSComparisonResult.OrderedAscending
    return result
  }

  func compareYearMonthDay(date: NSDate, toYearMonthDay: NSDate) -> NSComparisonResult {
    let dateComponents = yearMonthDayComponentsFromDate(date)
    let yearMonthDayComponents = yearMonthDayComponentsFromDate(toYearMonthDay)

    var result = compareInteger(dateComponents.year, right: yearMonthDayComponents.year)

    if result == NSComparisonResult.OrderedSame {
      result = compareInteger(dateComponents.month, right: yearMonthDayComponents.month)

      if result == NSComparisonResult.OrderedSame {
        result = compareInteger(dateComponents.day, right: yearMonthDayComponents.day)
      }
    }

    return result
  }

  func yearMonthDayComponentsFromDate(date: NSDate) -> NSDateComponents {
    let newComponents = components((NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay), fromDate: date)
    return newComponents
  }

  func compareInteger(left: Int, right: Int) -> NSComparisonResult {
    var result = NSComparisonResult.OrderedDescending

    if left == right {
      result = NSComparisonResult.OrderedSame
    } else if left < right {
      result = NSComparisonResult.OrderedAscending
    } else {
      result = NSComparisonResult.OrderedDescending
    }
    
    return result
  }
}
