//
//  EZView.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/19/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


typealias _V = EZView


class EZView {
    class func viewFromFrame(frame: CGRect) -> UIView {
        let view = UIView(frame: frame)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        return view
    }
    
    class func fixedSizeView(size: CGSize) -> UIView {
        let view = EZView.viewFromFrame(CGRectMake(0.0, 0.0, size.width, size.height))
        view.addConstraint(EZConstraint.width(view, width: size.width))
        view.addConstraint(EZConstraint.height(view, height: size.height))
        return view
    }
    
}