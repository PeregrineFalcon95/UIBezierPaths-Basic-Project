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
//    override func draw(_ rect: CGRect) {
//        ///Calling the next commented function will create a Rectangle
//        //createRectangle()
//
//        ///Calling the next commented function will create a Triangle
//        //createTriangle()
//
//        ///This if for draw an oval, by modifying the Rect, oval shapes can be changed
////        path = UIBezierPath(ovalIn: self.bounds)
////        path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,
////                                           y: 0.0,
////                                           width: self.frame.size.height,
////                                           height: self.frame.size.height))
//        ///Rectangle with corner radius
////        path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15)
//
//        ///Rectangle with custom corner radius
//        //path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [ .bottomLeft, .topRight ], cornerRadii: CGSize(width: 25, height: 0))
//
//
//
//
//        UIColor.orange.setFill()
//        path.fill()
//
//        UIColor.purple.setStroke()
//        path.stroke()
//
//
//    }
    
    var path: UIBezierPath!
     
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.backgroundColor = UIColor.darkGray
        //simpleShapeLayer()
        //maskLayer()
        twoShapesInOneView()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func twoShapesInOneView()
    {
        let width : CGFloat = self.frame.size.width / 2
        let height : CGFloat = self.frame.size.height / 2
        
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: width/2, y: 0.0))
        path1.addLine(to: CGPoint(x: 0.0, y: height))
        path1.addLine(to: CGPoint(x: width, y: height))
        path1.close()
         
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: width/2, y: height))
        path2.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path2.addLine(to: CGPoint(x: width, y: 0.0))
        path2.close()
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = UIColor.yellow.cgColor
         
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = UIColor.green.cgColor
        
        //Changing the position of 2nd shape
        shapeLayer2.position = CGPoint(x: width/2, y: height)
        shapeLayer1.position = CGPoint(x: width/2, y: 0.0)
        
        self.layer.addSublayer(shapeLayer1)
        self.layer.addSublayer(shapeLayer2)
    }
    
    func maskLayer()
    {
        self.createTriangle()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.path.cgPath
        
        self.backgroundColor = UIColor.brown
        
        self.layer.mask = shapeLayer
    }
    
    func simpleShapeLayer()
    {
        self.createRectangle()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.path.cgPath
        
        shapeLayer.fillColor = UIColor.brown.cgColor
        shapeLayer.strokeColor = UIColor.yellow.cgColor
        shapeLayer.lineWidth = 3.0
        
        //insertsublayer property can be used also
        self.layer.addSublayer(shapeLayer)
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
