//
//  Connectivity.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import Alamofire

protocol Connectivity : Alert {
    
}

extension Connectivity {
    func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    func isConnectedToInternet(inViewController viewController : UIViewController?) ->Bool {
        
        let status = NetworkReachabilityManager()!.isReachable
        if !status {
            showAlert(message: "No internet connection!", withTitle: "Connection Error", inViewController: viewController)
        }
        return status
    }
}
