//
//  ViewController.swift
//  ToyRobotSimulator
//
//  Created by Charmi Sutariya on 30/11/19.
//  Copyright © 2019 Charmi Sutariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: Outlets
    
    @IBOutlet weak var tableTop: UIImageView!
    @IBOutlet weak var robotImage: UIImageView!
    @IBOutlet weak var positionPickerView: UIPickerView!
    
    
    // MARK: Variables and Properties
    
    let pickerViewData = [["0", "1", "2", "3", "4"], ["0", "1", "2", "3", "4"], ["North", "East", "South", "West"]]
    
    
    var bottomLeftCornerOfTable : CGPoint = CGPoint.zero
    var oneCellUnit : CGFloat = 0
    var robot : Robot!
    
    
    var selectedXValue: Int = 0 {
        willSet {
            robot.x = newValue
        }
    }
    
    var selectedYValue: Int = 0 {
        willSet {
           robot.y = newValue
        }
    }
    
    var selectedDirectionValue: Int = 0 {
        willSet {
            guard let direction = Direction(rawValue: newValue) else {
                return
            }
            robot.direction = direction
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calculate()
    }
    
    
    // MARK: Custom Methods
    
    
    func setup() {
    
        // Set self to be the delegate of the picker view events
        positionPickerView.delegate = self
        // and data source
        positionPickerView.dataSource = self
        
        // Initialise the robot
        robot = Robot()
        
        // Hide the robot Image initially
        robotImage.isHidden = true
    }
    
    func calculate() {
        
        // Calculate the size of one cell unit
        oneCellUnit = tableTop.frame.size.width / CGFloat(Constants.Grid.size)
       
        let halfCellUnit = oneCellUnit * 0.5
        
        // Calculate the South-West coordinate of the Tabletop
        bottomLeftCornerOfTable = CGPoint(x: tableTop.frame.minX + halfCellUnit, y: tableTop.frame.maxY - halfCellUnit)
    }
    
    func updateRobotView(){
        
        // Rotates the robot based on the input from the picker view control
        UIView.animate(withDuration: 0.25) {
            self.robotImage.transform = CGAffineTransform(rotationAngle:  CGFloat(Constants.Angle.degress_90 * Double(self.selectedDirectionValue)))
        }
        
        updateRobotPostion()
    }
    
    
    func updateRobotPostion(){
        
        // Calculates and updates the position of the robot
        // Based on the input from the picker view control or other given controls
        let goToPostion = CGPoint(x: bottomLeftCornerOfTable.x + (CGFloat(robot.x) * oneCellUnit), y: bottomLeftCornerOfTable.y - (CGFloat(robot.y) * oneCellUnit))
        
        UIView.animate(withDuration: 0.25) {
            self.robotImage.center = goToPostion
        }
    }
    
    
    // MARK: Action Methods
    
    
    // MARK: Place
    
    @IBAction func place(_ sender: UIButton) {
        
        if !robot.isPlaced {
            robot.isPlaced = true
            robotImage.isHidden = false
        }
        
        robot.x = selectedXValue
        robot.y = selectedYValue
        robot.direction = Direction(rawValue: Int(selectedDirectionValue))!
        
        updateRobotView()
        
    }
    
    
    // MARK: Move
    
    @IBAction func move(_ sender: UIButton) {
        
        if !robot.isPlaced {
            return
        }
        
        robot.move()
        
        updateRobotPostion()
        
    }
    
    
    // MARK: Rotate
    
    @IBAction func rotate(_ sender: UIButton) {
        
    }
    
    // MARK: Report
    
    @IBAction func report(_ sender: UIButton) {
        
    }
    
}

