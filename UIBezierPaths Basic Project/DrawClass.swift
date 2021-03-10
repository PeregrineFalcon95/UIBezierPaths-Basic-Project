//
//  DrawClass.swift
//  UIBezierPaths Basic Project
//
//  Created by Mac mini on 9/3/21.
//

import UIKit
enum Shape
{
    case circle
    case fillCircle
    case rectangle
    case fillRectangle
}

extension FloatingPoint
{
    
}

class DrawClass: UIView {

    var currentShape : Shape?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        guard let currentContext = UIGraphicsGetCurrentContext() else
        {
            return
        }
        
        //drawRectangle(using: currentContext, isFilled: false)
    }
    
    private func drawCircle(using context : CGContext, isFilled : Bool)
    {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        //context.addArc(center: <#T##CGPoint#>, radius: <#T##CGFloat#>, startAngle: <#T##CGFloat#>, endAngle: <#T##CGFloat#>, clockwise: <#T##Bool#>)
    }
    
    private func drawRectangle( using context: CGContext, isFilled : Bool)
    {
        let strokeDistance : CGFloat = 25
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let lowerLeftCorner = CGPoint(x: centerPoint.x - strokeDistance, y: centerPoint.y + strokeDistance)
        let lowerRightCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y + strokeDistance)
        let upperRightCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y - strokeDistance * 2)
        let upperLefCorner = CGPoint(x: centerPoint.x - strokeDistance, y: centerPoint.y - strokeDistance * 2)
        
        context.move(to: lowerLeftCorner)
        context.addLine(to: lowerLeftCorner)
        context.addLine(to: lowerRightCorner)
        context.addLine(to: upperRightCorner)
        context.addLine(to: upperLefCorner)
        context.addLine(to: lowerLeftCorner)
        
        context.setLineCap(.square)
        context.setLineWidth(10.0)
        
        if isFilled
        {
            context.setFillColor( UIColor.purple.cgColor )
            context.fillPath()
        }
        else
        {
            context.setStrokeColor(UIColor.red.cgColor)
            context.strokePath()
        }
    }
    
    func drawShape(selectedShape : Shape)
    {
        currentShape = selectedShape
        setNeedsDisplay()
    }
}
