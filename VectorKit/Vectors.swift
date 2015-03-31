//
//  Vectors.swift
//  ATCSim
//
//  Created by Ryan Nystrom on 3/15/15.
//  Copyright (c) 2015 Ryan Nystrom. All rights reserved.
//

import Foundation
import Darwin

public typealias Point = (x: Double, y: Double)

public func turnCenterOffset(radius: Double, heading: Double, isLeftTurn: Bool) -> Point {
  let adjustment = isLeftTurn ? M_PI : 0.0
  let angle = heading + adjustment
  let x = radius * cos(angle)
  let y = radius * sin(angle)
  return (x, y)
}

public func turnCenter(radius: Double, heading: Double, isLeftTurn: Bool, point: Point) -> Point {
  let offset = turnCenterOffset(radius, heading, isLeftTurn)
  return (offset.x + point.x, offset.y + point.y)
}

public func tangentPoint(center: Point, tangent: Double, radius: Double, isLeftTurn: Bool) -> Point {
  let adjustment = (isLeftTurn ? 1.0 : -1.0) * M_PI / 2.0
  let theta = tangent + adjustment
  let x = cos(theta) * radius
  let y = sin(theta) * radius
  return (center.x + x, center.y + y)
}
