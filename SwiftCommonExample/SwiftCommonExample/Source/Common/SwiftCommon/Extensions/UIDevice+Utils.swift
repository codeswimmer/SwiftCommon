//
//  UIDevice+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/4/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIDevice {
    
    class func currentOrientation() -> UIDeviceOrientation {return UIDevice.currentDevice().orientation}
    class func isPortraitOrFlat() -> Bool {return currentOrientation().isPortrait || currentOrientation().isFlat}

}
