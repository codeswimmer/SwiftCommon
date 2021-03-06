//
//  String+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation


extension String {
    public func fullTextRange() -> NSRange {return NSMakeRange(0, countElements(self))}
    public func fullTextRangeMinus(amount: Int = 0) -> NSRange {return NSMakeRange(0, length() - amount)}
    
    public func length() -> Int {return countElements(self)}
    public subscript (i: Int) -> String {return String(Array(self)[i])}
    
    static public func readTextFromFile(name: String, type: String = "txt", encoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        if let path = NSBundle.mainBundle().pathForResource(name, ofType: type) {
            var possibleContent = String.stringWithContentsOfFile(path, encoding: encoding, error: nil)
            if let text = possibleContent {return text}
        }
        return nil
    }

    public func words() -> [String]? {
        if self.length() > 0 {
            var words: [String] = [String]()
            var word: String?
            
            for character in self {
                switch character {
                case " ", "\t", "\n":
                    if let w = word {
                        words.append(w)
                        word = nil
                    }
                    
                default:
                    if var w = word {
                        w.append(character)
                        word = w
                    }
                    else {
                        word = ""
                        word!.append(character)
                        word = word!
                    }
                }
            }
            if let w = word {
                words.append(w)
                word = nil
            }
            return words
        }

        return nil
    }

    public func padding(amount: Int) -> String {
        var working = ""
        if amount > 0 {for i in 0...amount - 1 {working = working + "."}}
        return working
    }
}