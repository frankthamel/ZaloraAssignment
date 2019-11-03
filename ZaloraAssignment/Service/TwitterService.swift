//
//  TwitterService.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/2/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import Swifter
import SafariServices
import Alamofire
import AlamofireImage

extension SignInViewController : SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

class TwitterService {
    
    static let instance = TwitterService()
    
    private let swifter = Swifter(consumerKey: TWITTER_CONSUMER_KEY, consumerSecret: TWITTER_CONSUMER_SECRET)
    public private(set) var userToken : TwitterUserToken? = nil
    
    func authorize(inViewController viewController: UIViewController, completion : @escaping (_ token : TwitterUserToken?, _ error : Error?) -> ()) {
        if let url = URL(string: APP_URL_SCHEME) {
            swifter.authorize(withCallback: url, presentingFrom: viewController, success: { (token, response) in
                if let token = token {
                    self.userToken = TwitterUserToken(key: token.key, screenName: token.screenName, secret: token.secret, userID: token.userID, verifier: token.verifier)
                    completion(self.userToken,nil)
                } else {
                    self.userToken = nil
                    completion(nil,nil) // need to defibne an error enum
                }
            }) { (error) in
                self.userToken = nil
                completion(nil,error)
            }
        }
    }
    
    func getUser(withUserId userId : String, success: @escaping (TwitterUserProfile) -> Void ) {
        self.swifter.showUser(UserTag.id(userId), success: { (json) in
            
            let data = "\(json)".data(using: .utf8)!
            let decoder = JSONDecoder()
            let profile = try? decoder.decode(TwitterUserProfile.self, from: data)
            
            if let profile = profile {
                success(profile)
            } else {
                // log error
            }
        }) { (error) in
            //log error
        }
    }
    
    func downloadImageFor(imageUrl: String, completion: @escaping (_ image: UIImage) -> ()) {
        Alamofire.request(imageUrl).responseImage { (imageResponse) in
            guard let image = imageResponse.result.value else { return }
            completion(image)
        }
    }
    
    //    self.swifter.getTimeline(for: UserTag.id(token.userID!), success: { json in
    //      print(json)
    //    }, failure: { error in
    //      // ...
    //    })
    
    
    
    
    
}



