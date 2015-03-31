//
//  Velocity.swift
//  ATCSim
//
//  Created by Ryan Nystrom on 3/15/15.
//  Copyright (c) 2015 Ryan Nystrom. All rights reserved.
//

import Foundation

public func velocity(time: NSTimeInterval, rate: Double, initial: Double) -> Double {
  return initial + time * rate
}

public func velocityLimited(time: NSTimeInterval, rate: Double, initial: Double, limit: Double) -> Double {
  let unlimited = velocity(time, rate, initial)
  return unlimited > limit ? limit : unlimited
}

public func turnRate(angle: Double, velocity: Double) -> Double {
  // http://aviation.stackexchange.com/a/2872
  let magicConstant = 1091.0
  return magicConstant * tan(angle) / velocity
}

