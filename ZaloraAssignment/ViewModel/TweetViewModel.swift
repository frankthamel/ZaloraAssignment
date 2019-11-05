//
//  TweetViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

/// This is the view model responsible for Tweet items display inside the Home View Tweets table view.
struct TweetViewModel {
    /// TweetModel
    let tweetModel : TweetModel
}

extension TweetViewModel {
    
    /// This represents the message displayed inside the cell in the Tweets table view.
    var mesasge : String {
        return tweetModel.text
    }
    
    /// This represents the message identifier displayed bottom of the cell in the Tweets table view.
    var identifier : String {
        if let messageIdentifier = tweetModel.text.split(separator: " ").first {
            return messageIdentifier.contains("/") ? "message \(messageIdentifier)" : ""
        } else {
            return ""
        }
    }
}
