//
//  CreateTweetItemViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/4/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

/// This is the view model responsible for Tweet items display inside the posted Tweets table view.
struct CreateTweetItemViewModel {
    /// This is the model responsible for Tweet items display inside the posted Tweets table view.
    let createTweetModel : CreateTweetModel
}

extension CreateTweetItemViewModel {
    
    /// This represents the message displayed inside the cell in the created Tweets table view.
    var message : String {
        return createTweetModel.text
    }
    
    /// This represents the message status displayed inside the cell in the created Tweets table view.
    var isSuccess : Bool {
        return createTweetModel.isSuccess
    }
}
