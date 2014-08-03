//
//  String+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation


extension String {
    func fullTextRange() -> NSRange {return NSMakeRange(0, countElements(self))}
    func fullTextRangeMinus(amount: Int = 0) -> NSRange {return NSMakeRange(0, length() - amount)}
    
    func length() -> Int {return countElements(self)}
    subscript (i: Int) -> String {return String(Array(self)[i])}
    
    static func readTextFromFile(name: String, type: String = "txt") -> String? {
        if let path = NSBundle.mainBundle().pathForResource(name, ofType: type) {
            var possibleContent = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)
            if let text = possibleContent {return text}
        }
        return nil
    }

    func words() -> [String]? {
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
                    if word {
                        word = word! + character
                    }
                    else {
                        word = ""
                        word = word! + character
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
}