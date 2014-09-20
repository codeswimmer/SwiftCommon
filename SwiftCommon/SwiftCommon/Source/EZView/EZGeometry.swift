//
//  EZGeometry.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public typealias EZG = EZGeometry
public typealias _G = EZG

@objc public class EZGeometry {
    public var _r: Rect = Rect()
    public var r: Rect {return _r}
}

// MARK: CGPoint
public extension EZGeometry {
    public class func point(x: CGFloat, _ y: CGFloat) -> CGPoint {return CGPointMake(x, y)}
    
    public class func distanceFrom(point: CGPoint, toPoint: CGPoint) -> CDouble {
        let x1 = point.x, y1 = point.y
        let x2 = toPoint.x, y2 = toPoint.y
        
        // explicity casting for compiling on 64-bit device
        return sqrt(CDouble(pow((CDouble(x2) - CDouble(x1)), CDouble(2.0)) + pow((CDouble(y2) - CDouble(y2)), CDouble(2.0))))
    }
    
    public class func angleBetween(#startPoint: CGPoint, endPoint: CGPoint) -> CDouble {
        // explicity casting for compiling on 64-bit device
        return CDouble(atan2(CDouble(endPoint.x - startPoint.x), CDouble(endPoint.y - startPoint.y))) * 180.0 / M_PI
    }

}

public func + (left: CGPoint, right: CGPoint) -> CGPoint {return CGPointMake(left.x + right.x, left.y + right.y)}
public func - (left: CGPoint, right: CGPoint) -> CGPoint {return CGPointMake(left.x - right.x, left.y - right.y)}
public func * (left: CGPoint, right: CGPoint) -> CGPoint {return CGPointMake(left.x * right.x, left.y * right.y)}
public func / (left: CGPoint, right: CGPoint) -> CGPoint {return CGPointMake(left.x / right.x, left.y / right.y)}


// MARK: CGSize
public extension EZGeometry {
    public class func size(width: CGFloat, _ height: CGFloat) -> CGSize {return CGSizeMake(width, height)}
    public class func squareSize(amount: CGFloat) -> CGSize {return size(amount, amount)}
}

// MARK: CGRect
public extension EZGeometry {
    
    public struct Rect {
        public static func size(size: CGSize) -> CGRect {return _G.rectWithSize(size)}
        public static func widthHeight(width: CGFloat, _ height: CGFloat) -> CGRect {return _G.rectWithSize(width, height)}
    }
    
    public class func rect(x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {return CGRectMake(x, y, width, height)}
    public class func rectFrom(rect: CGRect, withX: CGFloat) -> CGRect {return EZG.rect(withX, rect.origin.y, rect.width, rect.height)}
    public class func rectFrom(rect: CGRect, withY: CGFloat) -> CGRect {return EZG.rect(rect.origin.x, withY, rect.width, rect.height)}
    public class func rectFrom(rect: CGRect, withWidth: CGFloat) -> CGRect {return EZG.rect(rect.origin.x, rect.origin.y, withWidth, rect.height)}
    public class func rectFrom(rect: CGRect, withHeight: CGFloat) -> CGRect {return EZG.rect(rect.origin.x, rect.origin.y, rect.width, withHeight)}
    public class func rectWithOrigin(origin: CGPoint) -> CGRect {return EZG.rect(origin.x, origin.y, 0.0, 0.0)}
    public class func rectWithSize(size: CGSize) -> CGRect {return EZG.rect(0.0, 0.0, size.width, size.height)}
    public class func rectWithSize(width: CGFloat, _ height: CGFloat) -> CGRect {return EZG.rect(0.0, 0.0, width, height)}
    public class func rectWith(origin: CGPoint, size: CGSize) -> CGRect {return EZG.rect(origin.x, origin.y, size.width, size.height)}
    public class func centerPoint(rect: CGRect) -> CGPoint {return EZG.point(rect.minX + rect.width / 2.0, rect.minY + rect.height / 2.0)}
    
    public class func rectRemainder(rect: CGRect, amount: CGFloat, edge: CGRectEdge) -> CGRect {
        var slice = CGRectZero, remainder = CGRectZero
        CGRectDivide(rect, &slice, &remainder, amount, edge)
        return remainder
    }
    
    public class func rectSlice(rect: CGRect, amount: CGFloat, edge: CGRectEdge) -> CGRect {
        var slice = CGRectZero, remainder = CGRectZero
        CGRectDivide(rect, &slice, &remainder, amount, edge)
        return slice
    }
    
    public class func rectGrow(rect: CGRect, amount: CGFloat, edge: CGRectEdge) -> CGRect {
        switch edge {
        case .MinXEdge: return CGRectMake(rect.minX - amount, rect.minY, rect.width + amount, rect.height)
        case .MinYEdge: return CGRectMake(rect.minX, rect.minY - amount, rect.width, rect.height + amount)
        case .MaxXEdge: return CGRectMake(rect.minX, rect.minY, rect.width + amount, rect.height)
        case .MaxYEdge: return CGRectMake(rect.minX, rect.minY, rect.width, rect.height + amount)
        }
    }
    
    public class func horizontalCenter(rect: CGRect, other: CGRect) -> CGFloat {return rect.midX - other.width / 2.0}
    public class func verticalCenter(rect: CGRect, other: CGRect) -> CGFloat {return rect.midY - other.height / 2.0}
}
