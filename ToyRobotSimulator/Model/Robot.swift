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


// MARK: Extensions

extension Robot {
    
    
    // MARK: Instance Methods
    
    
    // Sets the current direction to the next direction along
    // clockwise or anticlockwise path
    mutating func rotate(clockwise: Bool) {
        
        var nextValue: Int
        
        if clockwise {
            nextValue = (direction.rawValue + 1) % Direction.totalNumberOfDirections
        } else {
            nextValue = (direction.rawValue + (Direction.totalNumberOfDirections - 1)) % Direction.totalNumberOfDirections
        }
        
        guard let direction = Direction(rawValue: nextValue) else {
            assertionFailure("Rotate Direction: Invalid Calculation Logic")
            return
        }
        
        self.direction = direction
    }
    
    
    // Increment or decrement the x or y by one unit
    // based on the current direction
    mutating func move() {
        
        switch direction {
        case .north:
            // Clamps the y to maximum grid bounds
            if y >= Constants.Grid.maxBounds {
                return
            }
            y += 1
            print("go north")
        case .south:
            // Clamps the y to minimum grid bounds
            if y <= Constants.Grid.minBounds {
                return
            }
            y -= 1
            print("go south")
        case .east:
            // Clamps the x to maximum grid bounds
            if x >= Constants.Grid.maxBounds {
                return
            }
            x += 1
            print("go east")
        case .west:
            // Clamps the x to minimum grid bounds
            if x <= Constants.Grid.minBounds {
                return
            }
            x -= 1
            print("go west")
        }
        
        print("x: \(x), y: \(y)")
        
    }
    
}

