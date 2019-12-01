//
//  Robot.swift
//  ToyRobotSimulator
//
//  Created by Charmi Sutariya on 01/12/19.
//  Copyright © 2019 Charmi Sutariya. All rights reserved.
//

import Foundation


// MARK: Robot

struct Robot {
    
    // MARK: Variables and Properties
    
    var x: Int = 0
    var y: Int = 0
    var direction: Direction = .north
    
    var isPlaced: Bool = false
    
    var description: String {
        return "x: \(x) y: \(y) Direction: \(direction)"
    }
    
}
