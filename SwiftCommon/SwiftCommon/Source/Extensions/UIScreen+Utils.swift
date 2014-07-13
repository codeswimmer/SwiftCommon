//
//  UIScreen+String.swift
//  MockerSK
//
//  Created by Keith Ermel on 7/4/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIScreen {
    
    class func aspectRatio() -> CGFloat {
        let screenSize = UIScreen.screenBounds()
        return screenSize.height > screenSize.width
            ? screenSize.height / screenSize.width
            : screenSize.width / screenSize.height
    }
    
    class func screenBounds() -> CGRect {return UIScreen.mainScreen().bounds}
    class func screenSize() -> CGSize {return UIScreen.screenBounds().size}
}
