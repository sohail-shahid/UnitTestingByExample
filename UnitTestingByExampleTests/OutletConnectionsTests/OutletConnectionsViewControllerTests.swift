//
//  OutletConnectionsViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 18/08/2023.
//

import XCTest
@testable import UnitTestingByExample

final class OutletConnectionsViewControllerTests: XCTestCase {
    
    func testOutletConnectionsVcShouldBeConnected() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let stub = storyboard.instantiateViewController(identifier: "OutletConnectionsViewController") as? OutletConnectionsViewController
        XCTAssertNotNil(stub)
    }
    
    func testOutletsShouldBeConnected() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let stub = storyboard.instantiateViewController(identifier: "OutletConnectionsViewController") as! OutletConnectionsViewController
        stub.loadViewIfNeeded()
        XCTAssertNotNil(stub.label, "label")
        XCTAssertNotNil(stub.button, "button")
    }
}
