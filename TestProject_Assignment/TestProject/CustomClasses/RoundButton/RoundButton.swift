//
//  RoundButton.swift
//  TestProject
//
//  Created by Vinod on 28/04/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var roundButton:Bool = false {
        didSet {
            if roundButton {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            self.layer.cornerRadius = self.frame.height / 2
        }
    }
    
}
