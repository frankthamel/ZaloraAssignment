//
//  AlertProtocol.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/4/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import UIKit

/// This protocol is used to show alerts.
protocol Alert {
    
}
extension Alert {
    /**
     This function is used to show an alert with a title and a message in a given view controller.
     - Parameters:
     - message: String
     - withTitle: String
     - inViewController: UIViewController?
     
     - parameter message: This is the alert-message that needs to display inside the alert dialog box.
     - parameter withTitle: This is the alert-title that needs to display inside the alert dialog box.
     - parameter inViewController: This is the presenting view-controller.
     
     ### Usage Example: ###
     ````
     showAlert(message : "String", withTitle : "String", inViewController : viewController)
     
     ````
     */
    func showAlert(message : String, withTitle title : String, inViewController viewController : UIViewController?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        viewController?.present(alert, animated: true)
    }
    
    /**
     This function is used to show an alert with a title and a message in a given view controller with a completion handler.
     - Parameters:
     - message: String
     - withTitle: String
     - inViewController: UIViewController?
     - handler: (UIAlertAction) ->()
     
     - parameter message: This is the alert-message that needs to display inside the alert dialog box.
     - parameter withTitle: This is the alert-title that needs to display inside the alert dialog box.
     - parameter inViewController: This is the presenting view-controller.
     - parameter handler: This is the completion handler, which runs after closing the alert view.
     
     ### Usage Example: ###
     ````
     showAlert(message : "String", withTitle : "String", inViewController : viewController)
     
     ````
     */
    func showAlert(message : String, withTitle title : String, inViewController viewController : UIViewController?,withHandler handler: @escaping (UIAlertAction) ->()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: handler))
        viewController?.present(alert, animated: true)
    }
}
