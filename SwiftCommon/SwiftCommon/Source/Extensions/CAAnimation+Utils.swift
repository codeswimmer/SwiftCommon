//
//  CAAnimation(Utils).swift
//  McMocker
//
//  Created by Keith Ermel on 7/5/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import QuartzCore

let kAnimationNameKey: String = "animation.name"

extension CAAnimation {
    
    func isAnimation(name: String) -> Bool {
        if let animID = getID() {return animID == name}
        return false
    }
    
    func setID(name: String) {setValue(name, forKey: kAnimationNameKey)}
    func getID() -> String? {
        if let value: AnyObject! = valueForKey(kAnimationNameKey) {
            if let animName: String = value as? String {
                return animName
            }
        }
        return nil
    }
    
    /*
    As of iOS 8 beta 3 this still causes an error in compilation
    
    Adding a class var in an extension (any extension or just 
    UIKit?) appears to cause the error
    
    class var nameKey: String {return "animation.name"}
    */
}
