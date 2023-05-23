//
//  CoveredClassTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 20/05/2023.
//

// code line test coverage
// https://github.com/AlDanial/cloc
import XCTest
@testable import UnitTestingByExample
final class CoveredClassTests: XCTestCase {
    
    func testMaxShouldReturnFirstPram() {
        let result = CoveredClass.max(3, 2)
        XCTAssertEqual(result, 3)
    }
    
    func testMaxShouldReturn2ndPram() {
        let result = CoveredClass.max(1, 2)
        XCTAssertEqual(result, 2)
    }
    
    func testCommaSeprated() {
        let stub = CoveredClass()
        let result = stub.commaSeparated(from: 1, to: 3)
        XCTAssertEqual(result, "1,2,3")
    }
    
    func testBoundaryCheck() {
        let stub = CoveredClass()
        let result = stub.commaSeparated(from: 1, to: 1)
        XCTAssertEqual(result, "1")
    }
    
    func testCalculateAreaWhenWidthSet() {
        let stub = CoveredClass()
        stub.width = 100
        XCTAssertEqual(stub.area, 10000)
    }
}
