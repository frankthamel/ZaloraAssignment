//
//  StringExtensionTests.swift
//  ZaloraAssignmentTests
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import ZaloraAssignment

class StringExtensionTests: XCTestCase {

    var sut : String!
    override func setUp() {
        super.setUp()
        sut = "***This is a *** sample text. ***"
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_replaceFirst() {
        XCTAssertEqual(sut.replaceFirst(of: "***", with: ""), "This is a *** sample text. ***")
    }


}
