//
//  XIBBasedViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 23/05/2023.
//

import XCTest
@testable import UnitTestingByExample

final class XIBBasedViewControllerTests: XCTestCase {
    func testXibBasedLoading() {
        let sut = XIBBasedViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.label)
    }
}
