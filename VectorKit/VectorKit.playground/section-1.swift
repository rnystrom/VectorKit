// Playground - noun: a place where people can play

import UIKit
import XCPlayground
import VectorKit

let bounds = CGRect(x: 0, y: 0, width: 400, height: 200)
let view = UIView(frame: bounds)
view.backgroundColor = UIColor.lightGrayColor()

XCPShowView("view", view)

func dot() -> CALayer {
  let layer = CALayer()
  layer.bounds = CGRect(x: 0, y: 0, width: 4, height: 4)
  layer.cornerRadius = 2
  layer.backgroundColor = UIColor.redColor().CGColor
  return layer
}

let bank = 30.0 * M_PI / 180.0
let velocity = 15.0
let initial = (x: 100.0, y: 100.0)
let vector = (x: 300.0, y: 120.0)
let heading = 333.0 * M_PI / 180.0
let left = true

let plane = dot()
plane.position = CGPoint(x: initial.x, y: initial.y)
view.layer.addSublayer(plane)

let vectorLayer = dot()
vectorLayer.position = CGPoint(x: vector.x, y: vector.y)
view.layer.addSublayer(vectorLayer)

let r = VectorKit.turnRadius(velocity, bank)
let center = VectorKit.turnCenter(r, heading, left, initial)

let circleBounds = CGRect(x: 0, y: 0, width: r * 2, height: r * 2)
let path = UIBezierPath(roundedRect: circleBounds, cornerRadius: circleBounds.size.height / 2.0)
let circle = CAShapeLayer()
circle.bounds = circleBounds
circle.position = CGPoint(x: center.x, y: center.y)
circle.strokeColor = UIColor.redColor().CGColor
circle.fillColor = nil
circle.lineWidth = 0.5
circle.path = path.CGPath
view.layer.addSublayer(circle)

let tangent = VectorKit.tangentHeading(r, left, center, vector)

let line = CALayer()
line.backgroundColor = UIColor.yellowColor().CGColor
line.bounds = CGRect(x: 0, y: 0, width: 800, height: 0.5)
line.position = vectorLayer.position
line.transform = CATransform3DMakeRotation(CGFloat(tangent), 0, 0, 1.0)
view.layer.addSublayer(line)

let tp = VectorKit.tangentPoint(center, tangent, r, left)

let intersect = dot()
intersect.position = CGPoint(x: tp.x, y: tp.y)
view.layer.addSublayer(intersect)
