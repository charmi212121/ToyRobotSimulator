//
//  ToyRobotSimulatorTests.swift
//  ToyRobotSimulatorTests
//
//  Created by Charmi Sutariya on 30/11/19.
//  Copyright © 2019 Charmi Sutariya. All rights reserved.
//

import XCTest
@testable import ToyRobotSimulator

class ToyRobotSimulatorTests: XCTestCase {

    var robot = Robot(x: 0, y: 0, direction: .south, isPlaced: true)
    
    // MARK: Move Logic Tests
    
    // Test the Move Logic of Robot
    func testMoveTowardsNorth() {
        robot.direction = .north
        robot.move()
        XCTAssertEqual(robot.x, 0)
        XCTAssertEqual(robot.y, 1)
    }
    
    func testMoveTowardsWest() {
        robot.direction = .west
        robot.move()
        XCTAssertEqual(robot.x, 0)
        XCTAssertEqual(robot.y, 0)
    }
    
    func testMoveTowardsEast() {
        robot.direction = .east
        robot.move()
        XCTAssertEqual(robot.x, 1)
        XCTAssertEqual(robot.y, 0)
    }
    
    // MARK: Clamp Logic Tests
    
    // Test the Clamp Logic of Robot
    func testOutOfBoundsMove() {
        robot.direction = .south
        robot.move()
        XCTAssertEqual(robot.x, 0)
        XCTAssertEqual(robot.y, 0)
    }
    
    // MARK: Rotate Logic Tests
    
    // Test the Direction Rotation logic of Robot
    func testRotate() {
        robot.rotate(clockwise: true)
        XCTAssertEqual(robot.direction, Direction.west)
    }

}
