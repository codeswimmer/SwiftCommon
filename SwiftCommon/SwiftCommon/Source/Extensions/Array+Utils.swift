//
//  Array+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/11/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation

extension Array {

    func each(action: (T) -> ()) {for i in self {action(i)}}
    func any(predicate: (T) -> Bool) -> Bool {return self.find(predicate).count > 0}
    func all(predicate: (T) -> Bool) -> Bool {return self.find(predicate).count == self.count}
    func contains<T : Equatable>(item:T) -> Bool {return self.indexOf(item) != nil}
    
    func indexOf<T : Equatable>(item:T) -> Int? {
        for index in 0..<self.count {if self[index] as T == item {return index}}
        return nil
    }
    
    func find(predicate: (T) -> Bool) -> [T] {
        var foundItems = [T]()
        for item in self {
            let itemOfType = item as T
            if predicate(itemOfType) {foundItems += itemOfType}
        }
        return foundItems
    }

    func find(predicate: (T, Int) -> Bool) -> [T] {
        var foundItems = [T]()
        var index = 0
        for item in self {
            let itemOfType = item as T
            if predicate(itemOfType, index++) {foundItems += itemOfType}
        }
        return foundItems
    }
    
    func first(predicate: (T) -> Bool) -> T? {
        for item in self {
            let itemOfType = item as T
            if predicate(itemOfType) {return itemOfType}
        }
        return nil
    }
    
    // TODO: Add test for this
    func first(predicate: (T, Int) -> Bool) -> T? {
        var index = 0
        for item in self {
            let itemOfType = item as T
            if predicate(itemOfType, index++) {return itemOfType}
        }
        return nil
    }
    
    func firstWhere(predicate: (T) -> Bool) -> T? {
        for item in self {if predicate(item) {return item}}
        return nil
    }

    func firstWhere(predicate: (T) -> Bool, orDefault: () -> T) -> T {
        for item in self {if predicate(item) {return item}}
        return orDefault()
    }
    
    func expand<TResult>(predicate: (T) -> [TResult]?) -> [TResult] {
        var expanded = [TResult]()
        for item in self {if let result = predicate(item as T) {for r in result {expanded += r}}}
        return expanded
    }
    
    func take(count:Int) -> [T] {
        var takenItems = [T]()
        var i = 0
        while i < self.count && i < count {takenItems += self[i++]}
        return takenItems
    }
    
    func takeWhile(predicate: (T) -> Bool) -> [T] {
        var takenItems = [T]()
        for item in self {
            let itemOfType = item as T
            if predicate(itemOfType) {takenItems += itemOfType}
            else {break}
        }
        return takenItems
    }
    
    func skip(count:Int) -> [T] {
        var skippedItems = [T]()
        var i = count
        while i < self.count {skippedItems += self[i++]}
        return skippedItems
    }
    
    func skipWhile(predicate: (T) -> Bool) -> [T] {
        var skippedItems = [T]()
        var keepSkipping = true
        for item in self {
            let itemOfType = item as T
            if !predicate(itemOfType) {keepSkipping = false}
            if !keepSkipping {skippedItems += itemOfType}
        }
        return skippedItems
    }
}