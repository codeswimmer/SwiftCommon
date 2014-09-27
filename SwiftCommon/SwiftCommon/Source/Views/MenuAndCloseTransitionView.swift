//
//  MenuAndCloseTransitionView.swift
//  MenuToCloseSpike
//
//  Created by Keith Ermel on 9/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public class MenuAndCloseTransitionView: AnimatedTransitionView {
    
    // MARK: Overrides
    override func performAnimation() {
        switch _state {
        case .Menu: transitionFromMenuToClose()
        case .Close: transitionFromCloseToMenu()
        }
    }
    
    // MARK: Animations
    func transitionFromMenuToClose() {
        
        func introEnded() {
            slideMenuCenterLineOffscreenLeft()
            crossOuterLines()
            _state = .Close
        }
        
        CATransaction.begin()
        CATransaction.setCompletionBlock(introEnded)
        slideMenuCenterLineToTheRight()
        tipMenuOuterLines()
        CATransaction.commit()
    }

    func transitionFromCloseToMenu() {
        func introEnded() {
            slideCloseCenterLineToTheRight()
            uncrossOuterLines()
            _state = .Menu
        }
        
        CATransaction.begin()
        CATransaction.setCompletionBlock(introEnded)
        tipCloseOuterLines()
        CATransaction.commit()
    }
    
    func slideMenuCenterLineToTheRight() {
        origCenterLinePosition = centerLine.position
        
        var pos = origCenterLinePosition
        var origX = pos.x
        centerLine.position = CGPointMake(pos.x + 5.0, pos.y)
        
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = origX
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        centerLine.addAnimation(animation, forKey: "position")
    }
    
    func tipMenuOuterLines() {
        tipLine(topLine, y: -2.0)
        tipLine(bottomLine, y: 2.0)
    }
    
    func crossOuterLines() {
        let x: CGFloat = 2.0
        let y: CGFloat = 14.0
        updateLinePath(topLine, (x, 0.0), (18.0, y))
        updateLinePath(bottomLine, (x, 0.0), (18.0, -y))
    }
    
    func slideMenuCenterLineOffscreenLeft() {
        var pos = centerLine.position
        var origX = pos.x
        centerLine.position = CGPointMake(pos.x - self.bounds.width, pos.y)
        
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = origX
        animation.duration = 0.20

        centerLine.addAnimation(animation, forKey: "position")
    }
    
    func tipCloseOuterLines() {
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut))
        let duration: NSTimeInterval = 0.3
        updateLinePath(topLine, (2.0, 0.0), (16.0, 16.0), duration)
        updateLinePath(bottomLine, (2.0, 0.0), (16.0, -16.0), duration)
    }
    
    func uncrossOuterLines() {
        let duration: NSTimeInterval = 0.1
        tipLine(topLine, y: 0.0, duration: duration)
        tipLine(bottomLine, y: 0.0, duration: duration)
    }
    
    func slideCloseCenterLineToTheRight() {
        var pos = centerLine.position
        var origX = pos.x
        centerLine.position = CGPointMake(origCenterLinePosition.x, pos.y)
        
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = origX
        animation.duration = 0.10
        
        centerLine.addAnimation(animation, forKey: "position")
    }
    
    func tipLine(line: CAShapeLayer, y: CGFloat, duration: NSTimeInterval = 0.25) {
        var origPath = line.path
        line.path = configurePath((20.0, y))
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = origPath
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.duration = duration
        
        line.addAnimation(animation, forKey: "path")
    }
    
    func updateLinePath(line: CAShapeLayer, _ startPoint: (CGFloat,CGFloat), _ endPoint: (CGFloat,CGFloat), _ duration: NSTimeInterval = 0.1) {
        var origPath = line.path
        line.path = configurePath(startPoint, endPoint)
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = origPath
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.duration = duration
        
        line.addAnimation(animation, forKey: "path")
    }
    
    // MARK: Configuration
    private func configureView() {
        layoutMargins = UIEdgeInsets.insetsWithEqualSize(4.0)
        clipsToBounds = true
        configureCircle()
        configureLines()
    }
    
    private func configureCircle() {
        let margins = layoutMargins
        let size = bounds.size
        circle.frame = CGRectMake(margins.left, margins.top, size.width - margins.width, size.height - margins.height)
        circle.cornerRadius = (bounds.size.width - margins.width) / 2.0
        circle.backgroundColor = UIColor.clearColor().CGColor
        circle.borderColor = UIColor.whiteColor().CGColor
        circle.borderWidth = 3.0
        circle.masksToBounds = true
        layer.addSublayer(circle)
    }
    
    private func configureLines() {
        configureCenterLine()
        configureTopLine()
        configureBottomLine()
    }
    
    private func configureCenterLine() {
        let frame = CGRectMake(11.0, 21.0, 20.0, 3.0)
        configureLine(centerLine, frame: frame)
    }
    
    private func configureTopLine() {
        let r: CGRect = centerLine.frame
        let y: CGFloat = r.origin.y - 7.0
        let frame = CGRectMake(r.origin.x, y, r.width, r.height)
        configureLine(topLine, frame: frame)
    }
    
    private func configureBottomLine() {
        let r: CGRect = centerLine.frame
        let y: CGFloat = r.origin.y + 7.0
        let frame = CGRectMake(r.origin.x, y, r.width, r.height)
        configureLine(bottomLine, frame: frame)
    }
    
    private func configureLine(line: CAShapeLayer, frame: CGRect) {
        line.frame = frame
        line.strokeColor = UIColor.whiteColor().CGColor
        line.lineWidth = 3.0
        line.lineJoin = kCALineJoinRound
        line.lineCap = kCALineCapRound
        line.path = configurePath((20.0, 0.0))
        circle.addSublayer(line)
    }
    
    private func configurePath(endPoint: (CGFloat,CGFloat)) -> CGPathRef {return configurePath((0.0, 0.0), endPoint)}
    
    private func configurePath(startPoint: (x:CGFloat, y:CGFloat), _ endPoint: (x:CGFloat, y:CGFloat)) -> CGPathRef {
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, startPoint.x, startPoint.y)
        CGPathAddLineToPoint(path, nil, endPoint.x, endPoint.y)
        return path
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        origCenterLinePosition = CGPointZero
        
        super.init(frame: frame)
        
        circle = CALayer()
        centerLine = CAShapeLayer()
        topLine = CAShapeLayer()
        bottomLine = CAShapeLayer()
        
        configureView()
    }
    
    required public init(coder aDecoder: NSCoder) {
        origCenterLinePosition = CGPointZero
        
        super.init(coder: aDecoder)
        
        circle = CALayer()
        centerLine = CAShapeLayer()
        topLine = CAShapeLayer()
        bottomLine = CAShapeLayer()
        
        configureView()
    }
    
    public enum State: String {
        case Menu = "Menu"
        case Close = "Close"
        public func description() -> String {return self.toRaw()}
    }
    
    // MARK: Variables
    public var state: State {return _state}
    private var _state: State = .Menu
    private var origCenterLinePosition: CGPoint
    
    // MARK: Constants
    private let circle: CALayer!
    private let centerLine: CAShapeLayer!
    private let topLine: CAShapeLayer!
    private let bottomLine: CAShapeLayer!
}
