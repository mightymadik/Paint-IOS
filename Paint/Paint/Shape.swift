//
//  Shape.swift
//  Paint
//
//  Created by MacBook on 27.10.2022.
//

import UIKit

struct Shape {
    let shapeType: ShapeType
    let fill: Bool
    let strokeWidth: Float
    let color: UIColor
    var points: [CGPoint]
}

enum ShapeType: Int {
    case pencil = 1
    case circle
    case square
    case line
    case triangle
}
