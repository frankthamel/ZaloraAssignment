//
//  RoundedUIButton.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/2/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedUIButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 10.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = .white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
}
