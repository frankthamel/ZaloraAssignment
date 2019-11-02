//
//  SignInViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/2/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit

struct SignInViewModel {
    
    private let twitterService = TwitterService()
    
    func authorize(inViewController viewController: UIViewController) {
        twitterService.authorize(inViewController: viewController) { (token, error) in
            if let error = error {
                // error
                print(error.localizedDescription)
            }
            
            if let token = token {
                print("Token: \(token)")
                //viewController.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
            } else {
                // Error
            }
        }
    }
}
