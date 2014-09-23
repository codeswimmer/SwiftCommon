//
//  LayersAnimationViewController.swift
//  SwiftCommonExample
//
//  Created by Keith Ermel on 9/19/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


class CircleLayer: CAShapeLayer {
    class func circleWithRadius(radius: CGFloat = 100.0, color: UIColor, lineWidth: CGFloat = 5.0) -> CircleLayer {
        let circle = CircleLayer()
        let rect = CGRectMake(0.0, 0.0, radius * 2.0, radius * 2.0)
        circle.path = UIBezierPath(roundedRect: rect, cornerRadius: radius).CGPath
        circle.fillColor = UIColor.clearColor().CGColor
        circle.strokeColor = color.CGColor
        circle.lineWidth = lineWidth
        return circle
    }
}


class LayersAnimationViewController: UIViewController {

    func addCircleWithRadius(radius: CGFloat, color: UIColor, lineWidth: CGFloat = 5.0) -> CircleLayer {
        let circle = CircleLayer.circleWithRadius(radius: radius, color: color, lineWidth: lineWidth)
        circle.position = CGPointMake(CGRectGetMidX(view.frame) - radius, CGRectGetMidY(view.frame) - radius)
        view.layer.addSublayer(circle)
        return circle
    }
    
    func reveal(shape: CAShapeLayer, completion: (()->Void)? = nil) -> CABasicAnimation {
        beginTransaction(completion: completion)
        let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.duration = 0.5
        drawAnimation.repeatCount = 1.0
        drawAnimation.fromValue = NSNumber(float: 0.0)
        drawAnimation.toValue = NSNumber(float: 1.0)
        drawAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        shape.addAnimation(drawAnimation, forKey: "drawCircleAnimation")
        CATransaction.commit()
        return drawAnimation
    }
    
    func beginTransaction(completion: (()->Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock {if let done = completion {done()}}
    }
    
    func zoomOut(layer: CALayer, completion: (()->Void)? = nil) {
    }
    
    func revealCircles() {
        revealBlueCircle(){self.revealPurpleCircle(){self.revealRedCircle({self.revealOrangeCircle(nil)})}}
    }
    
    func revealBlueCircle(completion: (()->Void)?) {
        let blueCircle = addCircleWithRadius(50.0, color: UIColor.blueColor(), lineWidth: 15.0)
        reveal(blueCircle, completion: completion)
    }
    
    func revealPurpleCircle(completion: (()->Void)?) {
        let purpleCircle = self.addCircleWithRadius(33.0, color: UIColor.purpleColor(), lineWidth: 7.5)
        self.reveal(purpleCircle, completion: completion)
    }
    
    func revealRedCircle(completion: (()->Void)?) {
        revealCircle(25.0, color: UIColor.redColor(), lineWidth: 5.0, completion: completion)
    }
    
    func revealOrangeCircle(completion: (()->Void)?) {
        revealCircle(10.0, color: UIColor.orangeColor(), lineWidth: 3.3, completion: completion)
    }
    
    func revealCircle(radius: CGFloat, color: UIColor, lineWidth: CGFloat, completion: (()->Void)?) {
        let circle = self.addCircleWithRadius(radius, color: color, lineWidth: lineWidth)
        self.reveal(circle, completion: completion)
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blackColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        revealCircles()
    }
}
