//
//  AlertProtocol.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/4/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import UIKit

protocol Alert {
    
}
extension Alert {
    func showAlert(message : String, withTitle title : String, inViewController viewController : UIViewController?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        viewController?.present(alert, animated: true)
    }
}
