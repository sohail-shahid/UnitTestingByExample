//
//  MySingletonViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by SOHAIL KHAN on 28/05/2023.
//

import XCTest
@testable import UnitTestingByExample

final class MySingletonViewControllerTests: XCTestCase {
    override func setUp() {
        super.setUp()
        MySingletonAnalytics.stubbedInstance = MySingletonAnalytics()
    }
    
    override func tearDown() {
        MySingletonAnalytics.stubbedInstance = nil
        super.tearDown()
    }
    func test_viewDidAppear() {
        let sut = MySingletonViewController()
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    // Normally, assert something
    }

}
