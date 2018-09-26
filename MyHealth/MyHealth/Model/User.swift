//
//  User.swift
//  MyHealth
//
//  Created by Do Hoang Viet on 9/21/18.
//  Copyright © 2018 Do Hoang Viet. All rights reserved.
//

import Foundation

class User {
    var name: String
    var gender: String
    var birth: Date
    var weightCurrent: Float
    var weightGoal: Float
    var goal: String
    
    init(name: String,
         gender: String,
         birth: Date,
         weightCurrent: Float,
         weightGoal: Float,
         goal: String) {
        self.name = name
        self.gender = gender
        self.birth = birth
        self.weightCurrent = weightCurrent
        self.weightGoal = weightGoal
        self.goal = goal
    }
}
