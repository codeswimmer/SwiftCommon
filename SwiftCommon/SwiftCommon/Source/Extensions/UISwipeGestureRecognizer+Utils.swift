//
//  UISwipeGestureRecognizer+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UISwipeGestureRecognizer {
    func isLeft() -> Bool {return direction.isLeft()}
    func isRight() -> Bool {return direction.isRight()}
    func isUp() -> Bool {return direction.isUp()}
    func isDown() -> Bool {return direction.isDown()}
}


func ==(lhs: UISwipeGestureRecognizerDirection, rhs: UISwipeGestureRecognizerDirection) -> Bool {return lhs.toRaw() == rhs.toRaw()}

extension UISwipeGestureRecognizerDirection {
    func isLeft() -> Bool {return self == UISwipeGestureRecognizerDirection.Left}
    func isRight() -> Bool {return self == UISwipeGestureRecognizerDirection.Right}
    func isUp() -> Bool {return self == UISwipeGestureRecognizerDirection.Up}
    func isDown() -> Bool {return self == UISwipeGestureRecognizerDirection.Down}
}