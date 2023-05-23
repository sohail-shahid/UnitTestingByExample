//
//  CodeBasedViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 23/05/2023.
//

import XCTest
@testable import UnitTestingByExample

final class CodeBasedViewControllerTests: XCTestCase {
    func testCodeBaseLoading() {
        let sut = CodeBasedViewController(data: "from test" )
        sut.loadViewIfNeeded()
    }
}
