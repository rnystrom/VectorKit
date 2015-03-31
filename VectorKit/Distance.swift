//
//  Distance.swift
//  ATCSim
//
//  Created by Ryan Nystrom on 3/15/15.
//  Copyright (c) 2015 Ryan Nystrom. All rights reserved.
//

import Foundation
import Darwin

public func turnRadius(velocity: Double, bank: Double) -> Double {
  // http://aviation.stackexchange.com/a/2872
  let magicConstant = 11.26
  return pow(velocity, 2.0) / (magicConstant * tan(bank))
}

public func distance(x1: Double, y1: Double, x2: Double, y2: Double) -> Double {
  return sqrt(pow(x2 - x1, 2.0) + pow(y2 - y1, 2.0))
}

public func distance(p1: Point, p2: Point, center: Point) -> Double {
  let theta = thetaBetweenPoints(p1, center, p2)
  let percent = theta / (2 * M_PI)
  let r = distance(p1.x, p1.y, center.x, center.y)
  let c = circumference(r)
  return c * percent
}

public func circumference(radius: Double) -> Double {
  return 2 * M_PI * radius
}
