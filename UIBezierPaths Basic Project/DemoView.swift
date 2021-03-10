//
//  DemoView.swift
//  UIBezierPaths Basic Project
//
//  Created by Mac mini on 9/3/21.
//

import UIKit

class DemoView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //createRectangle()
        //createTriangle()
        
        
        //path = UIBezierPath(ovalIn: self.bounds)
//        path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,
//                                           y: 0.0,
//                                           width: self.frame.size.height,
//                                           height: self.frame.size.height))
        
        path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15)
        UIColor.orange.setFill()
        path.fill()

        UIColor.purple.setStroke()
        path.stroke()
        
        
        
    }
    
    var path: UIBezierPath!
     
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.backgroundColor = UIColor.darkGray
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func createRectangle()
    {
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        path.close()
    }
    
    func createTriangle()
    {
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
    
}
