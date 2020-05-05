//
//  BirdServiceTests.swift
//  AngryBirdsTests
//
//  Created by Chelsea Troy on 4/25/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import XCTest
@testable import AngryBirds

class BirdServiceTests: XCTestCase {
    var systemUnderTest: BirdService!

    override func setUp() {
        self.systemUnderTest = BirdService()
    }

    override func tearDown() {
        self.systemUnderTest = nil
    }

    func testAPI_returnsSuccessfulResult() {
        //Given
        var birds: [Bird]!
        var error: Error?
        
        let promise = expectation(description: "Completion handler is invoked")
        
        //When
        self.systemUnderTest.getBirds(completion: { data, shouldntHappen in
            birds = data
            error = shouldntHappen
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5)
        
        //Then
        XCTAssertNotNil(birds)
        XCTAssertNil(error)
    }

}
