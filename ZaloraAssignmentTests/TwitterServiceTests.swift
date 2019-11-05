//
//  TwitterServiceTests.swift
//  ZaloraAssignmentTests
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import ZaloraAssignment

class TwitterServiceTests: XCTestCase {
    
    var sut : TwitterService!
    
    override func setUp() {
        super.setUp()
        sut = TwitterService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ImageDownload() {
        let expectation = self.expectation(description: "Image downloaded")
        var downloadedImage: UIImage?
        
        sut.downloadImageFor(imageUrl: "https://abs.twimg.com/sticky/default_profile_images/default_profile_normal.png") { (image) in
            downloadedImage = image
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(downloadedImage)
    }
    
    
}
