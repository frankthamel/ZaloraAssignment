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
    let title : String
    
    var prifileImage : UIImage {
        return UIImage(named: "createTweetButton")!
    }
    
    var profileName : String {
        return "@\(title)"
    }
}

extension HomeViewModel {
    func configureView(profileImageView : UIImageView, profileNameLabel : UILabel ) {
        profileImageView.image = prifileImage
        profileNameLabel.text = title
    }
}
