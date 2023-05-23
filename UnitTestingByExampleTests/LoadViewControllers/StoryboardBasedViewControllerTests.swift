//
//  StoryboardBasedViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 23/05/2023.
//

import XCTest
@testable import UnitTestingByExample

final class StoryboardBasedViewControllerTests: XCTestCase {
    func testLoadVc() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let stub = storyboard.instantiateViewController(identifier: "StoryboardBasedViewController") as! StoryboardBasedViewController
        stub.loadViewIfNeeded()
        XCTAssertNotNil(stub.label)
    }
}
