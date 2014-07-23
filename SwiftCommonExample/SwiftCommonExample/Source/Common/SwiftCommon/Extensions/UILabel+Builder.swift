//
//  UILabel+Builder.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/4/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UILabel {
    
    class func labelWithSize(size: CGSize, text: String) -> UILabel {
        let label = UILabel(frame: _G.rectWithSize(size))
        label.text = text
        return label
    }
    
    func basicAttributes() -> NSDictionary {
        var attrs = NSMutableDictionary()
        if let myFont = font {attrs.setValue(myFont, forKey: NSFontAttributeName)}
        return NSDictionary(dictionary: attrs)
    }
    
    func size() -> CGSize {
        let util = NSString(string: text)
        return util.sizeWithAttributes(basicAttributes())
    }
    
    class Builder {
        class func start(size: CGSize) -> Builder {
            let builder = Builder(label: UILabel(frame: _G.rectWithSize(size)))
            return builder
        }

        // MARK: Text
        func text(text: String) -> Builder {return setLabelProperty{l in l.text = text}}
        func textColor(color: UIColor) -> Builder {return setLabelProperty{l in l.textColor = color}}
        
        // MARK: Alignment
        func textAlignment(a: NSTextAlignment = NSTextAlignment.Center) -> Builder {return setLabelProperty{l in l.textAlignment = a}}
        func centerAlignment() -> Builder {return textAlignment()}
        
        // MARK: Others Sorted Alphabetically
        func font(font: UIFont) -> Builder {return setLabelProperty{l in l.font = font}}
        
        // MARK: Internal API
        func setLabelProperty(change: (UILabel)->Void) -> Builder {if let l = label {change(l)}; return self}
        
        // MARK: Initialization
        init(label: UILabel) {self.label = label}
        
        // TODO: Move into UIView.Builder
        func addTapHandler(target: AnyObject!, action: Selector) -> Builder {
            return setLabelProperty({l in
                l.userInteractionEnabled = true
                l.addTapHandler(target, action: action)
                })
        }
        func backgroundColor(color: UIColor) -> Builder {return setLabelProperty{l in l.backgroundColor = color}}
        func tag(value: Int) -> Builder {return setLabelProperty{l in l.tag = value}}
        
        
        // MARK: Variables
        var label: UILabel?
    }
}
