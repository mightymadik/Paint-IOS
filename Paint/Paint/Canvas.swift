//
//  Lines.swift
//  Paint
//
//  Created by MacBook on 17.10.2022.
//

import UIKit

class Canvas: UIView {
    
    fileprivate var strokeColor = UIColor.black
    fileprivate var strokeWidth: Float = 3
    fileprivate var shapes = [Shape]()
    
    var shapeType = ShapeType.pencil
    var fill = false

    func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }
    
    func setFill() {
        fill.toggle()
    }
    
    func setShape(number: Int) {
        self.shapeType = ShapeType(rawValue: number) ?? .pencil
    }
    
    func undo() {
        _ = shapes.popLast()
        setNeedsDisplay()
    }
    
    func clear() {
        shapes.removeAll()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        shapes.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setLineCap(.round)
            guard let start = line.points.first else { return }
            guard let end = line.points.last else { return }
            let radius = CGPointDistance(from: start, to: end)
            let height = end.y - start.y
            let width = end.x - start.x
            let fill = line.fill
            let color = line.color.cgColor
            for (i, p) in line.points.enumerated() {
                
                switch line.shapeType {
                case .pencil:
                    drawPencil(context: context, indexOfLine: i, pointfLine: p)
                case .circle:
                    drawCircle(context: context, start: start, radius: radius, fill: fill, color: color)
                case .square:
                    drawRect(context: context, start: start, height: height, width: width, fill: fill, color: color)
                case .line:
                    drawLine(context: context, start: start, end: end, color: color)
                case .triangle:
                    drawTriangle(context: context, start: start, height: height, width: width, fill: fill, color: color)
                }
            }
            context.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        shapes.append(Shape.init(shapeType: shapeType, fill: fill, strokeWidth: strokeWidth, color: strokeColor, points: []))
            
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        guard var lastLine = shapes.popLast() else { return }
        lastLine.points.append(point)
        shapes.append(lastLine)
        setNeedsDisplay()
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        setNeedsDisplay()
        
    }
    func CGPointDistanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
        return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
    }

    func CGPointDistance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(CGPointDistanceSquared(from: from, to: to))
    }
    
    private func drawPencil(context: CGContext, indexOfLine: Int, pointfLine: CGPoint) {

        if indexOfLine == 0 {
            context.move(to: pointfLine)
        } else {
            context.addLine(to: pointfLine)
        }
    }
    
    private func drawCircle(context: CGContext, start: CGPoint, radius: CGFloat, fill: Bool, color: CGColor) {
        let circlePoint: CGRect = CGRect(x: start.x, y: start.y,
                                         width: radius,
                                         height: radius)

        context.addEllipse(in: circlePoint)
        if fill {
            context.setFillColor(color)
            context.fillPath()
        }
    }
    
    private func drawRect(context: CGContext, start: CGPoint, height: CGFloat, width: CGFloat, fill: Bool, color: CGColor) {
        let rect: CGRect = CGRect(x: start.x, y: start.y,
                                         width: width,
                                         height: height)

        context.addRect(rect)
        if fill {
            context.setFillColor(color)
            context.fillPath()
        }
    }
    
    private func drawLine(context: CGContext, start: CGPoint, end: CGPoint, color: CGColor) {
        context.move(to: start)
        context.addLine(to: end)

    }
    
    private func drawTriangle(context: CGContext, start: CGPoint, height: CGFloat, width: CGFloat, fill: Bool, color: CGColor) {

        let trianglePath = CGPath.triangle(in: CGRect(x: start.x, y: start.y, width: width, height: height))
        context.addPath(trianglePath)
        if fill {
            context.setFillColor(color)
            context.fillPath()
        }
    }

    
}
