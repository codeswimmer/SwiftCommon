//
//  EZView.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/19/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public typealias _V = EZView
public typealias _VB = _V.ViewBuilder
public typealias ViewBuilder = _V.ViewBuilder

public typealias VBSize = (width: CGFloat, height: CGFloat)


public class EZView {
    
    public struct ViewBuilder {
        // MARK: Public API
        public static func box(size: VBSize) -> _VB {return builder.setView(_V.view(size))}
        public func done(action: (ViewBuilder, UIView)->Void) {action(self, view)}
        
        // MARK: Styling
        public func color(color: UIColor) -> _VB {return changeProperty{v in v.backgroundColor = color}}
        public func roundedCorners(radius: CGFloat) -> _VB {return changeProperty{v in v.layer.cornerRadius = radius}}
        
        // MARK: View Management
        public func subviewOf(container: UIView) -> _VB {return changeProperty{v in container.addSubview(v)}}
        public func addChild(build: ((UIView)->UIView?)) -> _VB {return changeProperty{v in v.maybeAddSubview(build(v))}}
        
        // MARK: Layout
        public func centerAtTopOf(container: UIView, _ insets: UIEdgeInsets = UIEdgeInsetsZero) -> ViewBuilder {
            return changeProperty{v in v.centerAtTopOf(container, insets)}
        }
        
        private func changeProperty(change: (UIView)->Void) -> ViewBuilder {change(view); return masterBuilder}
        
        private func setView(view: UIView) -> ViewBuilder {
            _VB.builder.view = view
            return masterBuilder
        }
        
        // MARK: Initialization
        init(){view = UIView()}
        init(view: UIView) {self.view = view}
        
        // MARK: Public Vars
        public var view: UIView
        
        // MARK: Internal Vars
        var masterBuilder: ViewBuilder {return _VB.builder}
        
        // MARK: Private Vars
        private static var builder: ViewBuilder = ViewBuilder()
    }
    
    // MARK: Internal API
    class func view(size: VBSize) -> UIView {
        return _V.viewFromFrame(_G.rectWithSize(size.width, size.height))
    }
    
    // TODO: deprecated
    public class func viewFromFrame(frame: CGRect) -> UIView {
        let view = UIView(frame: frame)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        return view
    }
    
    public class func fixedSizeView(size: CGSize) -> UIView {
        let view = EZView.viewFromFrame(CGRectMake(0.0, 0.0, size.width, size.height))
        view.addConstraint(EZConstraint.width(view, width: size.width))
        view.addConstraint(EZConstraint.height(view, height: size.height))
        return view
    }
}
