//
//  CreateTweetItemViewModel.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/4/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation


struct CreateTweetItemViewModel {
    let createTweetModel : CreateTweetModel
}

extension CreateTweetItemViewModel {
    
    var message : String {
        return createTweetModel.text
    }
    
    var isSuccess : Bool {
        return createTweetModel.isSuccess
    }
}
