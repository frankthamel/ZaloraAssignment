//
//  TwitterUserToken.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

/// This is the model for the Twitter user token.
struct TwitterUserToken {
    /// This contains the user token.
    let key : String
    
    /// This contains the Twitter username.
    let screenName : String?
    
    /// This contains the secret key.
    let secret : String
    
    /// This contains the current user id.
    let userID : String?
    
    /// This contains the verifier.
    let verifier : String?
}
