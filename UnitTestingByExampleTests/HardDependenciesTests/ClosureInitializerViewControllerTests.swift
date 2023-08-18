//
//  ClosureInitializerViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 18/08/2023.
//

import XCTest
@testable import UnitTestingByExample

final class ClosureInitializerViewControllerTests: XCTestCase {
    func test_viewDidAppear() {
        let sut = ClosureInitializerViewController(makeAnalytics: { Analytics() })
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
        // Normally, assert something
    }

}
