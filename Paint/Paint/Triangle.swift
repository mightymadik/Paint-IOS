//
//  Triangle.swift
//  Paint
//
//  Created by MacBook on 27.10.2022.
//

import UIKit

extension CGPath{
  
  static func triangle(in rect: CGRect) -> CGPath {
      let path = CGMutablePath()
      
    let top = CGPoint(x: rect.minX, y: rect.height)
    let bottomLeft = CGPoint(x: rect.minX, y: rect.minY + rect.height)
    let bottomRight = CGPoint(x: rect.minX + rect.width, y: rect.minY + rect.height)

    path.addLines(between: [bottomLeft, top, bottomRight])
//      path.move(to: CGPoint(x: rect.minX, y: rect.height))
//      path.addLine(to: CGPoint(x:rect.height/2, y: rect.height/2))
//      path.addLine(to: CGPoint(x:rect.height, y:rect.height))
//      path.addLine(to: CGPoint(x:rect.minX, y:rect.height))
//
//      let shape = CAShapeLayer()
//      shape.path = path
//
    
    path.closeSubpath()
      return path
  }
}
