//
//  Connectivity.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import Alamofire

/// This protocol is used to check apps' internet connection.
protocol Connectivity : Alert {
    
}

extension Connectivity {
    /// This function is used to check apps' internet connection.
    func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    /**
     This function is used to check apps' internet connection, and if the internet connection is lost, it popups an alert message.
     - Parameters:
     - viewController: UIViewController?
     
     - parameter viewController: This is the presenting view controller.
     
     ### Usage Example: ###
     ````
     isConnectedToInternet(inViewController : viewController)
     
     ````
     */
    func isConnectedToInternet(inViewController viewController : UIViewController?) ->Bool {
        
        let status = NetworkReachabilityManager()!.isReachable
        if !status {
            showAlert(message: "No internet connection!", withTitle: "Connection Error", inViewController: viewController)
        }
        return status
    }
}
