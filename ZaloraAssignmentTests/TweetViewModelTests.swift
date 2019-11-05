//
//  TweetViewModelTests.swift
//  ZaloraAssignmentTests
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import ZaloraAssignment

class TweetViewModelTests: XCTestCase {
    
    var sut1 : TweetViewModel!
    var sut2 : TweetViewModel!
    
    override func setUp() {
        super.setUp()
        
        sut1 = TweetViewModel(tweetModel: TweetModel(text: "Message"))
        sut2 = TweetViewModel(tweetModel: TweetModel(text: "1/2 Message"))
    }
    
    override func tearDown() {
        sut1 = nil
        sut2 = nil
        super.tearDown()
    }
    
    func test_TweetViewModelCreation() {
        XCTAssertEqual(sut1.mesasge, "Message")
        XCTAssertEqual(sut1.identifier, "")
        
        XCTAssertEqual(sut2.mesasge, "1/2 Message")
        XCTAssertEqual(sut2.identifier, "message 1/2")
    }
    
    
    
}
