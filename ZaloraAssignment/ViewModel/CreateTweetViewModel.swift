//
//  CreateTweetViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import RxSwift

struct CreateTweetViewModel {
    
    let disposeBag : DisposeBag = DisposeBag()
    //let dataSource : []
    
    func postTweet(message : String , completion : @escaping (Bool,Bool) -> ()) {
        
        let messageFormatter = MessageFormatter()
        let messageTracker = BehaviorSubject(value: 0)
       
        do {
            let messages = try messageFormatter.splitSubMessagesUsing(source: message)
            
            messageTracker.subscribe { event in
                if let index = event.element {
                    TwitterService.instance.postTweet(message: messages[index]) { (status) in
                        if status {
                            print("Succesfullt posted the message : \(messages[index])")
                            // push to data sourse which binds to table view as a succuess
                            if index < (messages.count - 1) {
                                messageTracker.onNext(index + 1)
                            } else {
                                completion(true,true)
                            }
                        } else {
                            // push to data sourse which binds to table view as a falier
                            print("Faild to post the message : \(messages[index])")
                            completion(true,false)
                        }
                    }
                }
            }.disposed(by: disposeBag)

        } catch {
            completion(true,false)
            print(error.localizedDescription)
        }
    
    }
}
