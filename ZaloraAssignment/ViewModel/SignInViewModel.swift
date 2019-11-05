//
//  SignInViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/2/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit

/// This view model responsible for all the interactions inside the SignInViewController.
struct SignInViewModel {
    
    /**
     This function is used to authorize users via Twitter.
     - Parameters:
     - viewController: UIViewController
     
     - parameter viewController: This is the view-controller which presents the Twitter login in SFSafariViewController.
     
     ### Usage Example: ###
     ````
     authorize(inViewController: UIViewController)
     ````
     */
    func authorize(inViewController viewController: UIViewController) {
        TwitterService.instance.authorize(inViewController: viewController) { (token, error) in
            if let error = error {
                log.error(error.localizedDescription)
            }
            
            guard let token = token else { return }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navigationController = storyboard.instantiateViewController(withIdentifier: HOME_VIEW_CONTROLLER_NAVIGATION_CONTROLLER) as? UINavigationController
            
            guard let navController = navigationController else {return}
            
            viewController.modalPresentationStyle = .fullScreen
            viewController.present(navController, animated: true, completion: {
                if let homeViewController = navController.topViewController as? HomeViewController {
                    var homeViewModel = HomeViewModel(userProfile: TwitterUserProfile(screenName: token.screenName ?? "", name: "", imageUrl: ""))
                    homeViewController.homeViewModel.accept(homeViewModel)
                    
                    // get image url
                    TwitterService.instance.getUser(withUserId: token.userID ?? "") { (profile) in
                        log.info("Profile image url: \(profile.imageUrl) retreived successfully.")
                        // download image
                        TwitterService.instance.downloadImageFor(imageUrl: profile.imageUrl) { (image) in
                            homeViewModel.downloadedProfileImage = image
                            homeViewController.homeViewModel.accept(homeViewModel)
                        }
                    }
                }
            })
        }
    }
}
