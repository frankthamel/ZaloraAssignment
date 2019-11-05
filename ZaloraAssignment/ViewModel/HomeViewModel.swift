//
//  HomeViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import UIKit

/// This view model responsible for all the interactions inside the HomeViewController.
struct HomeViewModel {
    /// TwitterUserProfile
    let userProfile : TwitterUserProfile
    
    /// User profile image
    var downloadedProfileImage : UIImage?
    
    /// User profile image which is bound to view
    var profileImage : UIImage {
        return downloadedProfileImage ?? UIImage(named: "createTweetButton")!
    }
    
    /// User profile name  which is bound to view
    var profileName : String {
        return "@\(userProfile.screenName)"
    }
}

extension HomeViewModel {
    
    /**
     This method is used to set the user profile image and profile name in the home view.
     - Parameters:
     - profileImageView: UIImageView
     - profileNameLabel: UILabel
     
     - parameter profileImageView: Downloaded user profile image.
     - parameter profileNameLabel: Fetched user profile name.
     
     ### Usage Example: ###
     ````
     configureView(profileImageView: UIImageView, profileNameLabel: UILabel)
     
     ````
     */
    func configureView(profileImageView : UIImageView, profileNameLabel : UILabel ) {
        profileImageView.image = profileImage
        profileNameLabel.text = profileName
    }
}
