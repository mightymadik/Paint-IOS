//
//  CIrcles.swift
//  Paint
//
//  Created by MacBook on 20.10.2022.
//

//import UIKit
//
//class Circles: UIView{
//    fileprivate var strokeColor = UIColor.black
//    fileprivate var circleWidth: CGFloat = CGFloat(25 + (arc4random() % 50))
//    
//    func setCircleWidth(width: CGFloat){
//        self.circleWidth = CGFloat(width)
//    }
//    
//    func setStrokeColor(color: UIColor){
//        self.strokeColor = color
//    }
//    
//    func undo() {
//        _ = circles.popLast()
//        setNeedsDisplay()
//    }
//    
//    func clear() {
//        circles.removeAll()
//        setNeedsDisplay()
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = UIColor.clear
//    }
//        
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    fileprivate var circles = [Circle]()
//    
//    override func draw(_ rect: CGRect) {
//        // Get the Graphics Context
//        guard let context = UIGraphicsGetCurrentContext() else
//        { return }
//        
//        circles.forEach { circle in
//            context.setStrokeColor(circle.color.cgColor)
//            context.setLineWidth(CGFloat(circle.circleWidth))
//            
//            let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
//            let radius = (frame.size.width - 10)/2
//            
//            context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2, clockwise: true)
//            
//            context.strokePath()
//        }
//
//    }
//    
//    var circle = [CGPoint]()
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            let circleCenter = touch.location(in:view)
//            let circleWidth = CGFloat(25 + (arc4random() % 50))
//            let circleHeight = circleWidth
//            
//            let circleView = Circles(frame: CGRect(x: circleCenter.x, y: circleCenter.y, width: circleWidth, height: circleHeight))
//            view.addSubview(Circles)
//        }
////        circles.append(Circle.init(circleWidth: circleWidth, circleHeight: circleWidth, point:[], color: strokeColor))
//    }
//}
//
//
