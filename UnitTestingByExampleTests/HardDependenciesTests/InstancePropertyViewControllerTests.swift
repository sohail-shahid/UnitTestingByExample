//
//  InstancePropertyViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 18/08/2023.
//

import XCTest
@testable import UnitTestingByExample

final class InstancePropertyViewControllerTests: XCTestCase {
    func testViewDidAppear() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: InstancePropertyViewController = storyboard.instantiateViewController(identifier: String(describing: InstancePropertyViewController.self))
        sut.analytics = Analytics()
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    // Normally, assert something
    }
    
}
