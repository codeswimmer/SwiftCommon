//
//  DropTargetView.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/15/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

public class DropTargetView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    func hitTestDraggedView(view: UIView) -> Bool {
        if view == self {return false}
        
        if self.frame.contains(view.frame) {
            saveHighlightValues()
            highlight();
            return true
        }
        else {unhilight()}
        
        return false
    }
    
    func highlight() {
        self.layer.borderColor = borderHighlightColor.CGColor
        self.layer.backgroundColor = backgroundHighlightColor.CGColor
    }
    
    func unhilight() {
        if let value: AnyObject = self.layer.valueForKey(Key.highlight) {
            if let highlight = value as? Dictionary<String, UIColor> {
                self.layer.borderColor = highlight[Key.borderColor]?.CGColor
                self.layer.backgroundColor = highlight[Key.backgroundColor]?.CGColor
                self.layer.setValue(nil, forKey: Key.highlight)
            }
        }
    }
    
    func canAcceptDrop(view: UIView) -> Bool {return true}
    func willAcceptDrop(view: UIView) -> Bool {return true}
    
    // MARK: Internal API
    func saveHighlightValues() {
        if hasSavedHighlightValues() {return}
        
        let borderColor = UIColor(CGColor: self.layer.borderColor)
        let bgColor = UIColor(CGColor: self.layer.backgroundColor)
//        let value = [Key.borderColor: borderColor, Key.backgroundColor: backgroundColor]
//        layer.setValue(value, forKey: Key.highlight)
    }
    
    func hasSavedHighlightValues() -> Bool {
        if let value: AnyObject = self.layer.valueForKey(Key.highlight) {return true}
        return false
    }
    
    var borderHighlightColor = UIColor.colorWithRGB(192, 0, 0, 0.75)
    var backgroundHighlightColor = UIColor.colorWithRGB(253, 176, 104, 0.75)
    
    struct Key {
        static var backgroundColor: String {return "background.color"}
        static var borderColor: String {return "border.color"}
        static var hasEntered: String {return "has.entered"}
        static var highlight: String {return "highlight"}
    }
}
