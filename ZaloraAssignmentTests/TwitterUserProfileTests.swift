//
//  TwitterUserProfileTests.swift
//  ZaloraAssignmentTests
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import ZaloraAssignment

class TwitterUserProfileTests: XCTestCase {

    var sut : TwitterUserProfile!
    var testObj : TwitterUserProfile!
    
    override func setUp() {
        super.setUp()
        sut = TwitterUserProfile(screenName: "User", name: "User", imageUrl: "https://url")
        testObj = TwitterUserProfile(screenName: "User", name: "User", imageUrl: "https://url")
    }
    
    override func tearDown() {
        sut = nil
        testObj = nil
        super.tearDown()
    }

    func test_TwitterUserProfileCreation() {
        XCTAssertEqual(sut.screenName, testObj.screenName)
        XCTAssertEqual(sut.name, testObj.name)
        XCTAssertEqual(sut.imageUrl, testObj.imageUrl)
    }

}
