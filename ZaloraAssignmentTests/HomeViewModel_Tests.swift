//
//  HomeViewModel_Tests.swift
//  ZaloraAssignmentTests
//
//  Created by Frank Emmanuel on 11/5/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import ZaloraAssignment

class HomeViewModel_Tests: XCTestCase {

    var sut : HomeViewModel!
    var defaultProfileImage : UIImage!
    
    override func setUp() {
        super.setUp()
        
        sut = HomeViewModel(userProfile: TwitterUserProfile(screenName: "User", name: "User", imageUrl: "https://test"), downloadedProfileImage: nil)
        defaultProfileImage = UIImage(named: "createTweetButton")!
    }
    
    override func tearDown() {
        sut = nil
        defaultProfileImage = nil
        super.tearDown()
    }

    func test_HomeViewModelCreation() {
        XCTAssertEqual(sut.profileName, "@User")
        XCTAssertEqual(sut.profileImage, defaultProfileImage)
    }


}
