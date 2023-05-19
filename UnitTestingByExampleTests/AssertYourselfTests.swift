//
//  Chapter1Tests.swift
//  UnitTestingByExampleTests
//
//  Created by CRLHL-KHANNSOH2 on 18/05/2023.
//

import XCTest

class Student {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
extension Student: Equatable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return (lhs.name == lhs.name) && (lhs.age == rhs.age)
    }
}

// Chapter 1
final class AssertYourselfTests: XCTestCase {
    func testFail() throws {
        XCTFail()
    }
    
    func testFailWithSimpleMessage() {
        XCTFail("testFailWithSimpleMessage")
    }
    
    func testAssertTrue() {
        let success = true
        XCTAssertTrue(success)
    }
    
    func testAssertNil() {
        let optionalValue: Int? = nil
        XCTAssertNil(optionalValue)
    }
    
    func testAssertNotNil() {
        let optionalValue: Int? = 10
        XCTAssertNotNil(optionalValue)
    }
    
    func testAssertEqual() {
        let actual = "actual"
        XCTAssertEqual(actual, "actual", "Expected \"expected\" but got \"\(actual)\"")
    }
    
    func testFloatingPointDanger() {
        let result = 0.2 + 0.1
        XCTAssertEqual(result, 0.3, accuracy: 0.01)
    }
    
    func testStudentAssertEqual() {
        let student1 = Student(name: "Ezzah", age: 1)
        let student2 = Student(name: "Ezzah", age: 1)
        XCTAssertEqual(student1, student2)
    }
}
