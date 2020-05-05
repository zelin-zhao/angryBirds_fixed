//
//  BirdTest.swift
//  AngryBirdsTests
//
//  Created by Chelsea Troy on 4/21/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import XCTest
@testable import AngryBirds

class BirdTest: XCTestCase {

    func testBirdDebugDescription() {
        let subjectUnderTest = Bird(
            named: "American Crow",
            description: "Looking at you like you have just said the dumbest thing it's ever heard",
            imageUrl: "https://tinyurl.com/yc8hwfx9"
        )
        
        let actualValue = subjectUnderTest.debugDescription
        
        let expectedValue = "Bird(name: American Crow, description: Looking at you like you have just said the dumbest thing it's ever heard)"
        XCTAssertEqual(actualValue, expectedValue)
    }

}
