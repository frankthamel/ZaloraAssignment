//
//  TwitterUserTokenTests.swift
//  ZaloraAssignmentTests
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import ZaloraAssignment

class TwitterUserTokenTests: XCTestCase {
    
    var sut : TwitterUserToken!
    var testObj : TwitterUserToken!
    
    override func setUp() {
        super.setUp()
        sut = TwitterUserToken(key: "key", screenName: "name", secret: "secretkey", userID: "testID", verifier: nil)
        testObj = TwitterUserToken(key: "key", screenName: "name", secret: "secretkey", userID: "testID", verifier: nil)
    }
    
    override func tearDown() {
        sut = nil
        testObj = nil
        super.tearDown()
    }
    
    func test_TwitterUserTokenCreation() {
        XCTAssertEqual(sut.key, testObj.key)
        XCTAssertEqual(sut.screenName, testObj.screenName)
        XCTAssertEqual(sut.secret, testObj.secret)
        XCTAssertEqual(sut.userID, testObj.userID)
        XCTAssertEqual(sut.verifier, testObj.verifier)
    }
    
}
