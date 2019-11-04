//
//  TweetListViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct TweetListViewModel {

    let dataSource = PublishSubject<[TweetViewModel]>()
    var disposeBag = DisposeBag()

}

extension TweetListViewModel {

    // Tableview data handling
    func bindDataSource(tableView : UITableView) {
        dataSource.bind(to: tableView.rx.items(cellIdentifier: HOME_TABLE_VIEW_CELL)) { (row, tweetVM: TweetViewModel, cell: HomeTableViewCell) in
            cell.configureCell(tweet: tweetVM)
        }.disposed(by: disposeBag)
    }
    
    func fetchTweets(tableView : UITableView) {
        TwitterService.instance.getCurentUserTimeline(success: { (tweets) in
            
            DispatchQueue.main.async {
               tableView.refreshControl?.endRefreshing()
            }
            // create teet vm from tweets and
            let tweetVMList = tweets.map{TweetViewModel(tweetModel: $0)}
            self.dataSource.onNext(tweetVMList)
            
        }) { (status) in
            // log error
        }
    }
}
