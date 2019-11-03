//
//  HomeViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import UIKit

struct HomeViewModel {
    let userProfile : TwitterUserProfile
    
    var downloadedProfileImage : UIImage?
    
    var prifileImage : UIImage {
        return downloadedProfileImage ?? UIImage(named: "createTweetButton")!
    }
    
    var profileName : String {
        return "@\(userProfile.screenName)"
    }
}

extension HomeViewModel {
    func configureView(profileImageView : UIImageView, profileNameLabel : UILabel ) {
        profileImageView.image = prifileImage
        profileNameLabel.text = profileName
    }
}
