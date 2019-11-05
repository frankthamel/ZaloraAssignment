//
//  CreateTweetItemViewModelTests.swift
//  ZaloraAssignmentTests
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import ZaloraAssignment

class CreateTweetItemViewModelTests: XCTestCase {

    var sut : CreateTweetItemViewModel!
    let model = CreateTweetModel(text: "Message", isSuccess: true)
    
    override func setUp() {
        super.setUp()
        
        sut = CreateTweetItemViewModel(createTweetModel: model)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_ModelCreation() {
        XCTAssertEqual(sut.message, "Message")
        XCTAssertEqual(sut.isSuccess, true)
    }


}
