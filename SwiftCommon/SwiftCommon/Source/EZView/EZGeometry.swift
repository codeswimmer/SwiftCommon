//
//  EZGeometry.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


typealias EZG = EZGeometry
typealias _G = EZG

class EZGeometry {}

// MARK: CGPoint
extension EZGeometry {
    class func point(x: CGFloat, _ y: CGFloat) -> CGPoint {return CGPointMake(x, y)}
    
    class func distanceFrom(point: CGPoint, toPoint: CGPoint) -> CDouble {
        let x1 = point.x, y1 = point.y
        let x2 = toPoint.x, y2 = toPoint.y
        
        // explicity casting for compiling on 64-bit device
        return sqrt(CDouble(pow((CDouble(x2) - CDouble(x1)), CDouble(2.0)) + pow((CDouble(y2) - CDouble(y2)), CDouble(2.0))))
    }
    
    class func angleBetween(#startPoint: CGPoint, endPoint: CGPoint) -> CDouble {
        // explicity casting for compiling on 64-bit device
        return CDouble(atan2(CDouble(endPoint.x - startPoint.x), CDouble(endPoint.y - startPoint.y))) * 180.0 / M_PI
    }
}

@infix func + (left: CGPoint, right: CGPoint) -> CGPoint {return CGPointMake(left.x + right.x, left.y + right.y)}
@infix func - (left: CGPoint, right: CGPoint) -> CGPoint {return CGPointMake(left.x - right.x, left.y - right.y)}
@infix func * (left: CGPoint, right: CGPoint) -> CGPoint {return CGPointMake(left.x * right.x, left.y * right.y)}
@infix func / (left: CGPoint, right: CGPoint) -> CGPoint {return CGPointMake(left.x / right.x, left.y / right.y)}


// MARK: CGSize
extension EZGeometry {
    class func size(width: CGFloat, _ height: CGFloat) -> CGSize {return CGSizeMake(width, height)}
    class func squareSize(amount: CGFloat) -> CGSize {return size(amount, amount)}
}

// MARK: CGRect
extension EZGeometry {
    class func rect(x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {return CGRectMake(x, y, width, height)}
    class func rectFrom(rect: CGRect, withX: CGFloat) -> CGRect {return EZG.rect(withX, rect.origin.y, rect.width, rect.height)}
    class func rectFrom(rect: CGRect, withY: CGFloat) -> CGRect {return EZG.rect(rect.origin.x, withY, rect.width, rect.height)}
    class func rectFrom(rect: CGRect, withWidth: CGFloat) -> CGRect {return EZG.rect(rect.origin.x, rect.origin.y, withWidth, rect.height)}
    class func rectFrom(rect: CGRect, withHeight: CGFloat) -> CGRect {return EZG.rect(rect.origin.x, rect.origin.y, rect.width, withHeight)}
    class func rectWithOrigin(origin: CGPoint) -> CGRect {return EZG.rect(origin.x, origin.y, 0.0, 0.0)}
    class func rectWithSize(size: CGSize) -> CGRect {return EZG.rect(0.0, 0.0, size.width, size.height)}
    class func rectWithSize(width: CGFloat, _ height: CGFloat) -> CGRect {return EZG.rect(0.0, 0.0, width, height)}
    class func rectWith(origin: CGPoint, size: CGSize) -> CGRect {return EZG.rect(origin.x, origin.y, size.width, size.height)}
    class func centerPoint(rect: CGRect) -> CGPoint {return EZG.point(rect.minX + rect.width / 2.0, rect.minY + rect.height / 2.0)}
    
    class func rectRemainder(rect: CGRect, amount: CGFloat, edge: CGRectEdge) -> CGRect {
        var slice = CGRectZero, remainder = CGRectZero
        CGRectDivide(rect, &slice, &remainder, amount, edge)
        return remainder
    }
    
    class func rectSlice(rect: CGRect, amount: CGFloat, edge: CGRectEdge) -> CGRect {
        var slice = CGRectZero, remainder = CGRectZero
        CGRectDivide(rect, &slice, &remainder, amount, edge)
        return slice
    }
    
    class func rectGrow(rect: CGRect, amount: CGFloat, edge: CGRectEdge) -> CGRect {
        switch edge {
        case .MinXEdge: return CGRectMake(rect.minX - amount, rect.minY, rect.width + amount, rect.height)
        case .MinYEdge: return CGRectMake(rect.minX, rect.minY - amount, rect.width, rect.height + amount)
        case .MaxXEdge: return CGRectMake(rect.minX, rect.minY, rect.width + amount, rect.height)
        case .MaxYEdge: return CGRectMake(rect.minX, rect.minY, rect.width, rect.height + amount)
        }
    }
    
    class func horizontalCenter(rect: CGRect, other: CGRect) -> CGFloat {return rect.midX - other.width / 2.0}
    class func horizontalCenter(rect: CGRect, other: CGSize) -> CGFloat {return rect.midX - other.width / 2.0}
    class func verticalCenter(rect: CGRect, other: CGRect) -> CGFloat {return rect.midY - other.height / 2.0}
    class func verticalCenter(rect: CGRect, other: CGSize) -> CGFloat {return rect.midY - other.height / 2.0}
}
