//
//  SignInViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/2/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit

struct SignInViewModel {
    
    func authorize(inViewController viewController: UIViewController) {
        TwitterService.instance.authorize(inViewController: viewController) { (token, error) in
            if let error = error {
                // error
                print(error.localizedDescription)
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
                        print(profile.imageUrl)
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
