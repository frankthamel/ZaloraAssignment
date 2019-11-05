//
//  TweetModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

/// This is the model for the fetched Tweet.
struct TweetModel : Decodable {
    
    /// Fetched Tweet message.
    let text : String
}

/// This is the model for the created Tweet.
struct CreateTweetModel {
    
    /// Posted Tweet message.
    let text : String
    
    /// Posted Tweet message status.
    let isSuccess : Bool
}
