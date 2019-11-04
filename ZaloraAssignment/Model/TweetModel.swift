//
//  TweetModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

struct TweetModel : Decodable {
    let text : String
}

struct CreateTweetModel {
    let text : String
    let isSuccess : Bool
}
