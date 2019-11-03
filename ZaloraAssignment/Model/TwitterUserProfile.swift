//
//  TwitterUserProfile.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

struct TwitterUserProfile : Decodable {
    let screenName : String
    let name : String
    let imageUrl : String
    
    private enum CodingKeys : String, CodingKey {
        case screenName = "screen_name", name, imageUrl = "profile_image_url_https"

    }
}


