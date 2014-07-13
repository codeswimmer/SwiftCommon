//
//  NSAttributedString+Utils.swift
//  SwiftExtensions
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    class func withText(text: String, font: UIFont) -> NSAttributedString {
        return Builder(string: text).font(font).done()
    }
    
    class func withText(text: String, font: UIFont, kerning: CGFloat) -> NSAttributedString {
        return withText(text, font: font, kerning: kerning, textColor: UIColor.blackColor())
    }
    
    class func withText(text: String, font: UIFont, kerning: CGFloat, textColor: UIColor) -> NSAttributedString {
        return Builder(string: text).font(font).kerning(kerning).textColor(textColor).done()
    }
    
    func fullTextRange() -> NSRange {return NSMakeRange(0, self.length)}
    func fullTextRangeMinus(amount: Int = 0) -> NSRange {return NSMakeRange(0, self.length - amount)}
    
    class Builder {
        // MARK: Public API
        func font(font: UIFont) -> Builder {
            working.addAttribute(NSFontAttributeName, value: font, range: working.fullTextRange())
            return self
        }
        
        func kerning(kerning: CGFloat, range: NSRange? = nil) -> Builder {
            working.addAttribute(NSKernAttributeName, value: kerning, range: fullRangeIfNil(range))
            return self
        }
        
        // MARK: Color Attributes
        func textColor(textColor: UIColor) -> Builder {
            working.addAttribute(NSForegroundColorAttributeName, value: textColor, range: working.fullTextRange())
            return self
        }
        
        func backgroundColor(color: UIColor) -> Builder {
            working.addAttribute(NSBackgroundColorAttributeName, value: color, range: working.fullTextRange())
            return self
        }
        
        func done() -> NSAttributedString {return NSAttributedString(attributedString: working)}

        func fullRangeIfNil(range: NSRange?) -> NSRange {
            if let r = range {return r}
            else {return working.fullTextRange()}
        }
        
        // MARK: Initialization
        init(string: String) {working = NSMutableAttributedString(string: string)}

        // MARK: Variables
        var working: NSMutableAttributedString
    }
}
