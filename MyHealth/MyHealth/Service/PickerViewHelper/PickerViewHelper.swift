//
//  PickerViewHelper.swift
//  MyHealth
//
//  Created by Do Hoang Viet on 9/18/18.
//  Copyright © 2018 Do Hoang Viet. All rights reserved.
//

import Foundation


enum PickerViewType: Int {
    case day = 0
    case month
    case year
}

enum PickerViewTallType: Int {
    case tall = 0
    case type
}

enum PickerViewWeightType: Int {
    case weight = 0
    case comma
    case decimal
    case type
}

class PickerViewHelper {
    /// Gets/Sets array of month
    var months: [String] {
        get {
            var months: [String] = []
            for item in 1...12 {
                let month = "Tháng \(item)"
                months.append(month)
            }
            return months
        }
    }
    
    /// Gets/Sets a array of year
    var years: [String] {
        get {
            var years: [String] = []
            for year in 1950...2010 {
                years.append(String(year))
            }
            return years
        }
    }
    
    
    /// Gets/Sets a array of days
    var days: [Int] {
        get {
            var days: [Int] = []
            for item in 1...31 {
                days.append(item)
            }
            return days
        }
    }
    
    /// Gets/Sets a array of tall
    var talls: [Int] {
        get {
            var talls: [Int] = []
            for item in 90...300 {
                talls.append(item)
            }
            return talls
        }
    }
    
    /// Gets/Sets a array of weight
    var weights: [Int] {
        get {
            var weights: [Int] = []
            for item in 30...400 {
                weights.append(item)
            }
            return weights
        }
    }
    
    /// Gets/Sets a array of decimal of weight
    var decimalOfWeight: [Int] {
        get {
            var decimalOfWeight: [Int] = []
            for item in 0...9 {
                decimalOfWeight.append(item)
            }
            return decimalOfWeight
        }
    }
}
