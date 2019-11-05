//
//  CreateTweetViewModelTests.swift
//  ZaloraAssignmentTests
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import ZaloraAssignment

class CreateTweetViewModelTests: XCTestCase {

     var sut : CreateTweetViewModel!
       
       override func setUp() {
           super.setUp()
           
           sut = CreateTweetViewModel()
       }

    func test_postTweet() {
        
        // Create an expectation
        let expectation = self.expectation(description: "Post Tweet")
        
        sut.postTweet(message: "Message") { (completed , success , error) in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        //XCTAssertEqual(sut.dataSource, )
    }


}
