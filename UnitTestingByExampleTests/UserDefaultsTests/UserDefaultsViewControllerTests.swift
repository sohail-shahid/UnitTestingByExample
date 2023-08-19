//
//  UserDefaultsViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 20/08/2023.
//

import XCTest
@testable import UnitTestingByExample

final class UserDefaultsViewControllerTests: XCTestCase {

    var sut: UserDefaultsViewController!
    var fakeUserDefault: FakeUserDefaults!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: UserDefaultsViewController.self)) as? UserDefaultsViewController
        fakeUserDefault = FakeUserDefaults()
    }

    override func tearDown() {
        sut = nil
        fakeUserDefault = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_withEmptyUserDefaults_shouldShow0InCounterLabel() {
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.counterLabel.text, "0")
    }
    
    func test_viewDidLoad_with7InUserDefaults_shouldShow7InCounterLabel() {
        fakeUserDefault.set(7, forKey: "count")
        sut.userDefault = fakeUserDefault
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.counterLabel.text, "7")
    }
    
    func test_tappingButton_with12InUserDefaults_shouldShow13InCounterLabel() {
        fakeUserDefault.integers = ["count": 12]
        sut.userDefault = fakeUserDefault
        sut.loadViewIfNeeded()
        sut.incrementButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.counterLabel.text, "13")
    }
    
    func test_tappingButtonTwice_with42InUserDefaults_shouldShow44InCounterLabel() { fakeUserDefault.integers = ["count": 42]
        sut.userDefault = fakeUserDefault
        sut.loadViewIfNeeded()
        sut.incrementButton.sendActions(for: .touchUpInside)
        sut.incrementButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.counterLabel.text, "44")
    }
}
