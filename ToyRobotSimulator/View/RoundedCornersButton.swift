//
//  RoundedCornersButton.swift
//  ToyRobotSimulator
//
//  Created by Charmi Sutariya on 01/12/19.
//  Copyright © 2019 Charmi Sutariya. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornersButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

}
