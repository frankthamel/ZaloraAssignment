//
//  TweetViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

struct TweetViewModel {
    let tweetModel : TweetModel
}

extension TweetViewModel {
    var mesasge : String {
        return tweetModel.text
    }
    
    var identifier : String {
        if let messageIdentifier = tweetModel.text.split(separator: " ").first {
            return messageIdentifier.contains("/") ? "message \(messageIdentifier)" : ""
        } else {
            return ""
        }
    }
}
