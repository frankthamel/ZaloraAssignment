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
                    log.info("User authorized successfully.")
                    self.userToken = TwitterUserToken(key: token.key, screenName: token.screenName, secret: token.secret, userID: token.userID, verifier: token.verifier)
                    completion(self.userToken,nil)
                } else {
                    log.error("Cannot retreive the user token.")
                    self.userToken = nil
                    completion(nil,nil)
                }
            }) { (error) in
                log.error(error.localizedDescription)
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
                log.info("User profile loaded successfully.")
                success(profile)
            } else {
                 log.error("Cannot retreive the user profile")
            }
        }) { (error) in
             log.error(error.localizedDescription)
        }
    }
    
    func downloadImageFor(imageUrl: String, completion: @escaping (_ image: UIImage) -> ()) {
        Alamofire.request(imageUrl).responseImage { (imageResponse) in
            guard let image = imageResponse.result.value else {
                log.error("Error in profile image downloading.")
                return
            }
            log.info("image at url: \(imageUrl) downloaded successfully.")
            completion(image)
        }
    }
    
    func postTweet(message : String, successStatus : @escaping (Bool) -> ()) {
        self.swifter.postTweet(status: message, success: { status in
            log.info("Tweet: \(message) posted successfully.")
            successStatus(true)
        }, failure: { error in
            log.error(error.localizedDescription)
            successStatus(false)
        })
    }
    
    func getCurentUserTimeline(success: @escaping ([TweetModel]) -> Void , failier : @escaping (Bool) -> Void) {
        
        guard let userId = userToken?.userID else {
            log.error("Empty user token retreived.")
            failier(false)
            return
        }
        
        self.swifter.getTimeline(for: UserTag.id(userId), success: { json in
            let data = "\(json)".data(using: .utf8)!
            let decoder = JSONDecoder()
            let tweetModels = try? decoder.decode([TweetModel].self, from: data)
            
            if let tweets = tweetModels {
                log.info("User timeline loaded successfully.")
                success(tweets)
            } else {
                 log.error("Errir in loading user timeline.")
            }
        }, failure: { error in
            log.error(error.localizedDescription)
            failier(false)
        })
    }
    
}



