//
//  PlaysProjectUnitTestingTests.swift
//  PlaysProjectUnitTestingTests
//
//  Created by Lisa J on 2/12/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import XCTest
@testable import PlaysProjectUnitTesting

class PlaysProjectUnitTestingTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 18440,"allWords must be 0" )
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testWordCountsAreCorrect() {
        let playData = PlayData()
//        XCTAssertEqual(playData.wordCounts["cowardice"], 6, "cowardice does not appear 6 times.")
//        XCTAssertEqual(playData.wordCounts["affects"], 4, "cowardice does not appear 6 times.")
//        XCTAssertEqual(playData.wordCounts["enmity"], 4, "cowardice does not appear 6 times.")
        XCTAssertEqual(playData.wordCounts.count(for:"cowardice"), 6, "cowardice does not appear 6 times.")
        XCTAssertEqual(playData.wordCounts.count(for:"affects"), 4, "cowardice does not appear 6 times.")
        XCTAssertEqual(playData.wordCounts.count(for:"enmity"), 4, "cowardice does not appear 6 times.")
    }
    
    func testWordsLoadQuickly() {
        measure {
            _ = PlayData()
        }
    }
    
    func testUserFilterWorks() {
        let playData = PlayData()
        playData.applyUserFilter("100")
        XCTAssertEqual(playData.filteredWords.count,495, "filtered words do not equal 495")
        
    }
}
