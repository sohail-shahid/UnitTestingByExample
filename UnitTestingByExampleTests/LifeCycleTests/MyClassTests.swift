//
//  MyClassTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 19/05/2023.
//

import XCTest
@testable import UnitTestingByExample

// chapter 2

final class MyClassTests: XCTestCase {
    
    private var sut: MyClass!
    
    override func setUp() {
        super.setUp()
        sut = MyClass()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testMethodOne() {
        sut.methodOne()
    }
    
    func testMethodTwo() {
        sut.methodTwo()
    }
}
