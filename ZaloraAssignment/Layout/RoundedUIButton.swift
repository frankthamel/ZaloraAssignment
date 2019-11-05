//
//  RoundedUIButton.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/2/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit

/// This class is used to add custom inspectable attributes to the UIButton, which can be controlled directly from the attributes inspector.
@IBDesignable
class RoundedUIButton: UIButton {
    
    /// This inspectable property is used to directly control cornerRadius of the UIButton, from the attributes inspector.
    @IBInspectable var cornerRadius : CGFloat = 10.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    /// This inspectable property is used to directly control borderWidth of the UIButton, from the attributes inspector.
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    /// This inspectable property is used to directly control borderColor of the UIButton, from the attributes inspector.
    @IBInspectable var borderColor : UIColor = .white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
}
