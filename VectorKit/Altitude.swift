//
//  Altitude.swift
//  ATCSim
//
//  Created by Ryan Nystrom on 3/15/15.
//  Copyright (c) 2015 Ryan Nystrom. All rights reserved.
//

import Foundation

public func altitude(time: NSTimeInterval, rate: Double, initial: Double) -> Double {
  return initial + time * rate
}

public func altitudeLimited(time: NSTimeInterval, rate: Double, initial: Double, limit: Double) -> Double {
  let unlimited = altitude(time, rate, initial)
  return unlimited > limit ? limit : unlimited
}
