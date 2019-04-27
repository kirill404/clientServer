//
//  DotActivity.swift
//  views
//
//  Created by Кирилл Пучков on 28.03.2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import UIKit

class DotActivity: UIView {
    
    var view2: UIView!
    
    func run(view2: UIView) {
        self.view2 = view2
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 5,y: 5), radius: CGFloat(5), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        //change the fill color
        shapeLayer.fillColor = UIColor.gray.cgColor
        
        let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: 20,y: 5), radius: CGFloat(5), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = circlePath2.cgPath
        //change the fill color
        shapeLayer2.fillColor = UIColor.gray.cgColor
        
        let circlePath3 = UIBezierPath(arcCenter: CGPoint(x: 35,y: 5), radius: CGFloat(5), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer3 = CAShapeLayer()
        shapeLayer3.path = circlePath3.cgPath
        //change the fill color
        shapeLayer3.fillColor = UIColor.gray.cgColor
        var animation = CABasicAnimation(keyPath: "opacity")
        animation.beginTime = CACurrentMediaTime()
        animation.fromValue = 1.0
        animation.toValue = 0
        animation.duration = 1
        animation.repeatCount = .infinity
        shapeLayer.add(animation, forKey: "opacityAnimation")
        
        animation = CABasicAnimation(keyPath: "opacity")
        animation.beginTime = CACurrentMediaTime() + 0.1
        animation.fromValue = 1.0
        animation.toValue = 0
        animation.duration = 1
        animation.repeatCount = .infinity
        shapeLayer2.add(animation, forKey: "opacityAnimation")
        
        animation = CABasicAnimation(keyPath: "opacity")
        animation.beginTime = CACurrentMediaTime() + 0.2
        animation.fromValue = 1.0
        animation.toValue = 0
        animation.duration = 1
        animation.repeatCount = .infinity
        shapeLayer3.add(animation, forKey: "opacityAnimation")
        
        self.view2.layer.addSublayer(shapeLayer)
        self.view2.layer.addSublayer(shapeLayer2)
        self.view2.layer.addSublayer(shapeLayer3)
    }
    
    func stopAnimations() {
        self.view2.layer.removeAllAnimations()
    }
    
    func remove() {
        self.view2.layer.removeFromSuperlayer()
    }
}
