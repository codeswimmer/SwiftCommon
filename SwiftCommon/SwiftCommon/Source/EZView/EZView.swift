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
public typealias VBSquareSize = (CGFloat)

public func CGSizeFromVBSize(size: VBSize) -> CGSize {return CGSizeMake(size.width, size.height)}

public class EZView {
    
    public struct ViewBuilder {
        // MARK: Creation
        public static func box(size: VBSize) -> _VB {
            return 🚧.setView(_V.view(size)).sizeConstraint(size)
        }
        public static func fullScreen() -> _VB {return 🚧.setView(_V.fullScreenView())}
        public static func square(size: VBSquareSize) -> _VB {return 🚧.setView(_V.fixedSizeView(size))}
        
        // MARK: Utility Methods
        public func additions(action: (ViewBuilder, UIView)->Void) {action(self, view)}
        
        // MARK: Styling
        public func color(color: UIColor) -> _VB {return apply{v in v.backgroundColor = color}}
        public func roundedCorners(radius: CGFloat) -> _VB {
            return apply{v in v.layer.cornerRadius = radius}
        }
        
        // MARK: View Management
        public func subviewOf(container: UIView) -> _VB {return apply{v in container.addSubview(v)}}
        public func addChild(build: ((UIView)->UIView?)) -> _VB {
            return apply{v in self.view.maybeAddSubview(build(v))}
        }
        
        // MARK: Gesture Actions
        public func tapAction(action:()->Void) -> ViewBuilder {
            return apply{v in TapAction.attachToView(v, task: action)}
        }
        
        // MARK: Identification
        public func tag(tag: Int) -> ViewBuilder {return apply{v in v.tag = tag}}
        
        // MARK: Layout
        public func centerAtTopOf(container: UIView, _ insets: UIEdgeInsets = UIEdgeInsetsZero) -> _VB {
            return apply{v in v.centerAtTopOf(container, insets)}
        }
        public func centeredIn(container: UIView) -> _VB {return apply{v in v.centerWithin(container)}}
        public func fill(parent: UIView, bottomOf:UIView, topOf: UIView, insets: UIEdgeInsets) -> _VB {
            return apply {v in
                _C.fill(v, container: parent, bottomOf: bottomOf, topOf: topOf, insets: insets)
            }
        }
        public func lowPrioritySizeConstraint(fromItem: AnyObject, size: VBSize) -> _VB {
            return apply {v in
                v.addConstraints(_C.lowPrioritySizeConstraint(v, size: CGSizeFromVBSize(size)))
            }
        }
        public func sizeConstraint(size: VBSize) -> _VB {
            return apply {v in
                v.addConstraints(_C.sizeConstraint(v, size: CGSizeMake(size.width, size.height)))
            }
        }

        // MARK: Internal API
        private func apply(change: (UIView)->Void) -> ViewBuilder {change(view); return masterBuilder}
        private func setView(view: UIView) -> ViewBuilder {
            _VB.🚧.view = view
            return masterBuilder
        }
        
        // MARK: Initialization
        public init(){view = UIView()}
        public init(view: UIView) {self.view = view}
        
        // MARK: Public Vars
        public var view: UIView
        
        // MARK: Internal Vars
        var masterBuilder: ViewBuilder {return _VB.🚧}
        
        // MARK: Private Vars
        private static var 🚧: ViewBuilder = ViewBuilder()
    }
    
    // MARK: Internal API
    class func view(size: VBSize) -> UIView {
        return _V.viewFromFrame(_G.rectWithSize(size.width, size.height))
    }
    
    // MARK: deprecated
    public class func viewFromFrame(frame: CGRect) -> UIView {
        let view = UIView(frame: frame)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        return view
    }
    public class func fullScreenView(insets: UIEdgeInsets = UIEdgeInsetsZero) -> UIView {
        let screenSize = UIScreen.mainScreen().bounds.size
        let size = _G.size(screenSize.width - insets.right, screenSize.height - insets.bottom)
        let origin = _G.point(insets.left, insets.top)
        return _V.viewFromFrame(_G.rectWith(origin, size: size))
    }
    
    public class func fixedSizeView(size: VBSquareSize) -> UIView {return fixedSizeView(_G.size(size, size))}
    
    public class func fixedSizeView(size: CGSize) -> UIView {
        let view = EZView.viewFromFrame(CGRectMake(0.0, 0.0, size.width, size.height))
        view.addConstraint(EZConstraint.width(view, width: size.width))
        view.addConstraint(EZConstraint.height(view, height: size.height))
        return view
    }
}
