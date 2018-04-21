//
//  DrawView.swift
//  shawdow view testing
//
//  Created by elva wang on 11/27/17.
//  Copyright © 2017 elva wang. All rights reserved.
//

import Foundation
import UIKit

class DrawView: ShadowView {
    

    var isDrawing = false
    var lastPoint: CGPoint!
    var strokeColor: CGColor = UIColor.black.cgColor   //  so we can pass the color to stroke file property
    var strokes = [Stroke]()   // empty arr to save strokes
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard !isDrawing else {return}
            isDrawing = true
            guard let touch = touches.first else {return}
            let currentPoint = touch.location(in: self)
            lastPoint = currentPoint
            setNeedsDisplay()
            print(currentPoint)
        }
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard isDrawing else {return}
            guard let touch = touches.first else {return}
            let currentPoint = touch.location(in: self)
            let stroke = Stroke(startPoint: lastPoint, endPoint: currentPoint, color: strokeColor)
            lastPoint = currentPoint
            strokes.append(stroke)
            setNeedsDisplay()
//            print(currentPoint)
    
        }
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard isDrawing else {return}
            isDrawing = false
            guard let touch = touches.first else {return}
            let currentPoint = touch.location(in: self)
            let stroke = Stroke(startPoint: lastPoint, endPoint: currentPoint, color: strokeColor)
            strokes.append(stroke)
            lastPoint = nil
//            print(currentPoint)
            setNeedsDisplay()
        }

    override func draw(_ rect: CGRect) {  //  implementing the drawing method
        
 ///  drawing a circle *********************
                let path = UIBezierPath()
                let radius: Double = 100
                let center = CGPoint(x: rect.width/2, y: rect.height/2)
                path.move(to: CGPoint(x: center.x + CGFloat(radius), y : center.y ))
                
                for i in stride(from: 0, to: 361.0, by: 10) {
                    let radians = i * Double.pi / 180
                    let x = Double(center.x) + radius * cos(radians)
                    let y = Double(center.y) + radius * sin(radians)
                    path.addLine(to: CGPoint(x: x, y: y))
                    
                }
                path.lineWidth = 5
                path.stroke()    //  is the action of drawing
//                path.fill()
                setNeedsDisplay()
///   ending of drawing the circle *************************
        
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(10)
        context?.setLineCap(.round)  // fixed the broken line
        for stroke in strokes {
            context?.beginPath()
            context?.move(to: stroke.startPoint)
            context?.addLine(to: stroke.endPoint)
            context?.setStrokeColor(stroke.color)
            context?.strokePath()
//            path.fill()
        }
    }
    
    func erase(){
        strokes = []
        strokeColor = UIColor.black.cgColor
        setNeedsDisplay()
    }
}
