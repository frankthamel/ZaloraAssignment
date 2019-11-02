//
//  TwitterService.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/2/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import Swifter
import SafariServices

extension SignInViewController : SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

class TwitterService {
    
    private let swifter = Swifter(consumerKey: TWITTER_CONSUMER_KEY, consumerSecret: TWITTER_CONSUMER_SECRET)
    
    func authorize(inViewController viewController: UIViewController, completion : @escaping (_ token : String?, _ error : Error?) -> ()) {
        if let url = URL(string: APP_URL_SCHEME) {
            swifter.authorize(withCallback: url, presentingFrom: viewController, success: { (token, response) in
                if let token = token {
                    completion(token.key,nil)
                } else {
                    completion(nil,nil) // need to defibne an error enum
                }
            }) { (error) in
                completion(nil,error)
            }
        }
    }
    
    
    
}



