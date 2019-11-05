//
//  CreateTweetViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

/// This view model responsible for all the interactions inside the CreateTweetViewController.
struct CreateTweetViewModel {
    /// dispose bag
    let disposeBag : DisposeBag = DisposeBag()
    
    /// data source
    let dataSource = PublishSubject<[CreateTweetItemViewModel]>()
    
    /**
     This function is used to post Tweets.
     - Parameters:
     - message: String
     - completion: (Bool,Bool,MessageSplittingError?) -> ()
     
     - parameter message: This is the message that needs to Tweet.
     - parameter completion: This is the completion block that returns the status of the action.
     
     ### Usage Example: ###
     ````
     postTweet(message: "String") { (Bool, Bool, MessageSplittingError?) in
     
     }
     ````
     */
    func postTweet(message : String , completion : @escaping (Bool,Bool,MessageSplittingError?) -> ()) {
        
        let messageFormatter = MessageFormatter()
        let messageTracker = BehaviorSubject(value: 0)
        var sentSubMessagses : [CreateTweetItemViewModel] = []
        
        do {
            let messages = try messageFormatter.splitSubMessagesUsing(source: message)
            
            messageTracker.subscribe { event in
                if let index = event.element {
                    TwitterService.instance.postTweet(message: messages[index]) { (status) in
                        if status {
                            log.info("Succesfullt posted the message : \(messages[index])")
                            // push to data sourse which binds to table view as a succuess
                            if index < (messages.count - 1) {
                                messageTracker.onNext(index + 1)
                            } else {
                                completion(true,true,nil)
                            }
                            
                            let item = CreateTweetItemViewModel(createTweetModel: CreateTweetModel(text: messages[index], isSuccess: true))
                            sentSubMessagses.append(item)
                            self.dataSource.onNext(sentSubMessagses)
                            
                        } else {
                            // push to data sourse which binds to table view as a falier
                            log.error("Faild to post the message : \(messages[index])")
                            
                            let item = CreateTweetItemViewModel(createTweetModel: CreateTweetModel(text: messages[index], isSuccess: false))
                            sentSubMessagses.append(item)
                            self.dataSource.onNext(sentSubMessagses)
                            
                            completion(true,false,nil)
                        }
                    }
                }
            }.disposed(by: disposeBag)
        } catch {
            completion(true,false,error as? MessageSplittingError)
            log.error(error.localizedDescription)
        }
    }
    
}

extension CreateTweetViewModel {
    
    /**
     This function is used to bind the data source to the Tweets table view in a reactive way.
     - Parameters:
     - tableView: UITableView
     
     - parameter tableView: This is the tableView that is bound to the data source.
     
     ### Usage Example: ###
     ````
     bindDataSource(tableView: UITableView)
     
     ````
     */
    func bindDataSource(tableView : UITableView) {
        dataSource.bind(to: tableView.rx.items(cellIdentifier: CREATE_TWEET_TABLE_VIEW_CELL)) { (row, createTweetVM: CreateTweetItemViewModel, cell: CreateTweetTableViewCell) in
            cell.configureCell(tweetItemVM: createTweetVM)
        }.disposed(by: disposeBag)
    }
}
