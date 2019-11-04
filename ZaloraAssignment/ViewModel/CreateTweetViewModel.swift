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

struct CreateTweetViewModel {
    
    let disposeBag : DisposeBag = DisposeBag()
    let dataSource = PublishSubject<[CreateTweetItemViewModel]>()

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
                            print("Succesfullt posted the message : \(messages[index])")
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
                            print("Faild to post the message : \(messages[index])")
                            
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
            print(error.localizedDescription)
        }
    }

}

extension CreateTweetViewModel {

    // Tableview data handling
    func bindDataSource(tableView : UITableView) {
        dataSource.bind(to: tableView.rx.items(cellIdentifier: CREATE_TWEET_TABLE_VIEW_CELL)) { (row, createTweetVM: CreateTweetItemViewModel, cell: CreateTweetTableViewCell) in
            cell.configureCell(tweetItemVM: createTweetVM)
        }.disposed(by: disposeBag)
    }
}
