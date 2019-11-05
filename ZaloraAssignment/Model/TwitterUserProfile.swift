//
//  TwitterUserProfile.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

/// This is the model for the Twitter user profile.
struct TwitterUserProfile : Decodable {
    
    /// This contains the Twitter username.
    let screenName : String
    
    /// This contains the Twitter user name.
    let name : String
    
    /// This contains the user profile image url.
    let imageUrl : String
    
    private enum CodingKeys : String, CodingKey {
        case screenName = "screen_name", name, imageUrl = "profile_image_url_https"
        
    }
}


