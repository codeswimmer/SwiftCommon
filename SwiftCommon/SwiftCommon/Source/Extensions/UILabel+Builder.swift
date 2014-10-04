//
//  UILabel+Builder.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/4/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UILabel {
    
    public class func centeredFilling(
        container: UIView,
         _ insets: UIEdgeInsets = UIEdgeInsetsZero,
             done: ((UILabel)->Void)?)
    {
        let label = UILabel(frame: container.frame)
        label.textAlignment = NSTextAlignment.Center
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        container.addSubview(label)
        container.fillWith(label, insets)
        if let action = done {action(label)}
    }
    
    class func labelWithSize(size: CGSize, text: String) -> UILabel {
        let label = UILabel(frame: _G.rectWithSize(size))
        label.text = text
        return label
    }
    
    func basicAttributes() -> NSDictionary {
        var attrs = NSMutableDictionary()
        attrs.setValue(font, forKey: NSFontAttributeName)
        return NSDictionary(dictionary: attrs)
    }
    
    func size() -> CGSize {
        let util = NSString(string: text!)
        return util.sizeWithAttributes(basicAttributes())
    }
    
    public class Builder {
        public class func start(size: CGSize) -> Builder {
            let builder = Builder(label: UILabel(frame: _G.rectWithSize(size)))
            return builder
        }

        // MARK: Text
        public func text(text: String) -> Builder {return setLabelProperty{l in l.text = text}}
        public func textColor(color: UIColor) -> Builder {
            return setLabelProperty{l in l.textColor = color}
        }
        
        // MARK: Alignment
        public func textAlignment(a: NSTextAlignment = NSTextAlignment.Center) -> Builder {
            return setLabelProperty{l in l.textAlignment = a}
        }
        public func centerAlignment() -> Builder {return textAlignment()}
        
        // MARK: Others Sorted Alphabetically
        public func font(font: UIFont) -> Builder {return setLabelProperty{l in l.font = font}}
        
        // MARK: Internal API
        func setLabelProperty(change: (UILabel)->Void) -> Builder {
            if let l = _label {change(l)}; return self
        }
        
        // MARK: Initialization
        init(label: UILabel) {self._label = label}
        
        // TODO: Move into UIView.Builder
        func addTapHandler(target: AnyObject!, action: Selector) -> Builder {
            return setLabelProperty({l in
                l.userInteractionEnabled = true
                l.addTapHandler(target, action: action)
                })
        }
        func backgroundColor(color: UIColor) -> Builder {
            return setLabelProperty{l in l.backgroundColor = color}
        }
        func tag(value: Int) -> Builder {return setLabelProperty{l in l.tag = value}}
        
        
        // MARK: Variables
        public var label: UILabel? {return _label}
        private var _label: UILabel?
    }
}
