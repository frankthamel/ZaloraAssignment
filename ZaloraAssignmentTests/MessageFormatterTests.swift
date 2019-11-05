//
//  MessageFormatterTests.swift
//  ZaloraAssignmentTests
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import ZaloraAssignment

class MessageFormatterTests: XCTestCase {
    
    
    var sut : MessageFormatter!
    var messages : [String] = []

    override func setUp() {
        super.setUp()
        sut = MessageFormatter()
        
        /* #0 */ messages.append("")
        /* #1 */ messages.append("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        /* #2 */ messages.append("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        /* #3 */ messages.append("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        /* #4 */ messages.append("")
    }

    override func tearDown() {
        sut = nil
        messages.removeAll()
        super.tearDown()
    }

    func testSplitSubMessagesUsing()  {
        XCTAssertThrowsError(try sut.splitSubMessagesUsing(source: messages[0]))
        XCTAssertNoThrow(try sut.splitSubMessagesUsing(source: messages[1]))
        XCTAssertThrowsError(try sut.splitSubMessagesUsing(source: messages[2]))
        XCTAssertThrowsError(try sut.splitSubMessagesUsing(source: messages[3]))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            let _ : [String] = try! sut.splitSubMessagesUsing(source: messages[1])
        }
    }

}
