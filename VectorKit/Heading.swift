//
//  Heading.swift
//  ATCSim
//
//  Created by Ryan Nystrom on 3/15/15.
//  Copyright (c) 2015 Ryan Nystrom. All rights reserved.
//

import Foundation

public func heading(time: NSTimeInterval, rate: Double, initial: Double) -> Double {
  return initial + time * rate
}

public func headingLimited(time: NSTimeInterval, rate: Double, initial: Double, limit: Double) -> Double {
  let unlimited = heading(time, rate, initial)
  return unlimited > limit ? limit : unlimited
}

public func timeToHeading(initial: Double, desired: Double, rate: Double) -> NSTimeInterval {
  let delta = initial - desired
  return delta / rate
}

public func headingBetweenPoints(x1: Double, y1: Double, x2: Double, y2: Double) -> Double {
  let delta = atan2(sin(x1 - x2) * cos(y2), cos(y1) * sin(x2) - sin(y1) * cos(y2) * cos(x2 - x1))
  return delta % (2 * M_PI)
}

public func isLeftTurn(initial: Double, desired: Double) -> Bool {
  return initial > desired
}

public func tangentHeading(radius: Double, isLeftTurn: Bool, center: Point, externalPoint: Point) -> Double {
  let d = distance(center.x, center.y, externalPoint.x, externalPoint.y)
  let alpha = asin(radius / d)
  let beta = atan((center.y - externalPoint.y) / (center.x - externalPoint.x))
  let direction = isLeftTurn ? -1.0 : 1.0
  return beta + direction * alpha
}

// p2 is the vertex
public func thetaBetweenPoints(p1: Point, p2: Point, p3: Point) -> Double {
  let a = distance(p1.x, p1.y, p3.x, p3.y)
  let c = distance(p3.x, p3.y, p2.x, p2.y)
  return asin(a / c)
}
