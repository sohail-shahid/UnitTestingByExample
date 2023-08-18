//
//  OverrideViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by SOHAIL KHAN on 28/05/2023.
//

import XCTest
@testable import UnitTestingByExample

final class OverrideViewControllerTests: XCTestCase {    
    func test_viewDidAppear() {
        let sut = TestableOverrideViewController()
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    // Normally, assert something
    }

}

private class TestableOverrideViewController: OverrideViewController {
    override func analytics() -> Analytics { Analytics() }
}
