//
//  TweetModelTests.swift
//  ZaloraAssignmentTests
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import ZaloraAssignment

class TweetModelTests: XCTestCase {

    var sut : TweetModel!
    
    override func setUp() {
        super.setUp()
        sut = TweetModel(text: "Message")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_TweetModelCreation() {
        XCTAssertEqual(sut.text, "Message")
    }

}
