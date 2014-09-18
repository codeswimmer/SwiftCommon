//
//  CLBeacon+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/18/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation
import CoreBluetooth
import CoreLocation


//extension CLBeacon {func majorMinorString() -> String {return "\(major).\(minor)"}}

extension CBPeripheralManagerState {
    func description() -> String {
        var result = ""
        switch self {
        case .PoweredOff: result =  "Powered Off"
        case .PoweredOn: result =  "Powered On"
        case .Resetting: result =  "Resetting"
        case .Unauthorized: result =  "Unauthorized"
        case .Unsupported: result =  "Unsupported"
        default: result = "?"
        }
        return result
    }
}

extension CLProximity {
    
    func isImmediate() -> Bool {return self == CLProximity.Immediate}
    func isNotImmediate() -> Bool {return self != CLProximity.Immediate}
    
    func isNear() -> Bool {return self == CLProximity.Near}
    func isNotNear() -> Bool {return self != CLProximity.Near}
    
    func isFar() -> Bool {return self == CLProximity.Far}
    func isNotFar() -> Bool {return self != CLProximity.Far}
    
    func isUnknown() -> Bool {return self == CLProximity.Unknown}
    func isNotUnknown() -> Bool {return self != CLProximity.Unknown}
    
    func isNearOrImmediate() -> Bool {return self == CLProximity.Near || self == CLProximity.Immediate}
    
    func description() -> String {
        var result = ""
        switch self {
        case .Far: result = "Far"
        case .Near: result = "Near"
        case .Immediate: result = "Immediate"
        default: result = "?"
        }
        return result
    }
}

extension CLRegionState {
    func description() -> String {
        var result = ""
        switch self {
        case .Inside: result = "Inside"
        case .Outside: result = "Outside"
        case .Unknown: result = "Unknown"
        default: "?"
        }
        return result
    }
}
