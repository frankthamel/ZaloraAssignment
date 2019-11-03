//
//  TweetListViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

struct TweetListViewModel {
    
    var tweetsViewModel : [TweetViewModel]
    
    init() {
        self.tweetsViewModel = [TweetViewModel]()
    }
}

extension TweetListViewModel {
    func tweetViewModel(at index : Int) -> TweetViewModel {
        return self.tweetsViewModel[index]
    }
}
