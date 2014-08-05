//
//  Direction.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/26/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation

public enum Direction {
    case Unknown
    case Up
    case Down
    case Left
    case Right
    case Center
    case HorizontalCenter
    case VerticalCenter
    
    public func opposite() -> Direction? {
        switch self {
        case Unknown: return Unknown
        case Up: return Down
        case Down: return Up
        case Left: return Right
        case Right: return Left
        case Center: return Center
        case HorizontalCenter: return HorizontalCenter
        case VerticalCenter: return VerticalCenter
        default: return Unknown
        }
    }
    
    public func description() -> String {
        switch self {
        case Unknown: return "Unknown"
        case Up: return "Up"
        case Down: return "Down"
        case Left: return "Left"
        case Right: return "Right"
        case Center: return "Center"
        case HorizontalCenter: return "HorizontalCenter"
        case VerticalCenter: return "VerticalCenter"
        default: return ""
        }
    }
}

public enum CompassDirection {
    case Unknown
    case North
    case NorthEast
    case East
    case SouthEast
    case South
    case SouthWest
    case West
    case NorthWest
    case Center
    
    public func description() -> String {
        switch self {
        case Unknown: return "Unknown"
        case .North: return "North"
        case .NorthEast: return "NorthEast"
        case .East: return "East"
        case .SouthEast: return "SouthEast"
        case .South: return "South"
        case .SouthWest: return "SouthWest"
        case .West: return "West"
        case .NorthWest: return "NorthWest"
        case Center: return "Center"
        default: return ""
        }
    }
}

public enum BoxDirection {
    case Unknown
    case Top
    case TopLeft
    case Left
    case BottomLeft
    case Bottom
    case BottomRight
    case Right
    case TopRight
    case Center
    
    public func description() -> String {
        switch self {
        case Unknown: return "Unknown"
        case Top: return "Top"
        case TopLeft: return "TopLeft"
        case Left: return "Left"
        case BottomLeft: return "BottomLeft"
        case Bottom: return "Bottom"
        case BottomRight: return "BottomRight"
        case Right: return "Right"
        case TopRight: return "TopRight"
        case Center: return "Center"
        default:  return ""
        }
    }
}

