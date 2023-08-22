//
//  MockURLSession.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 22/08/2023.
//

import Foundation
import XCTest
@testable import UnitTestingByExample

func verifyMethodCalledOnce( methodName: String, callCount: Int, describeArguments: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) -> Bool {
    if callCount == 0 {
        XCTFail("Wanted but not invoked: \(methodName)", file: file, line: line)
        return false
    }
    if callCount > 1 {
        XCTFail("Wanted 1 time but was called \(callCount) times. " + "\(methodName) with \(describeArguments())", file: file, line: line)
        return false
    }
    return true
}

private class DummyURLSessionDataTask: URLSessionDataTask {
    override func resume() {}
}
class MockURLSession: URLSessionProtocol {
    var dataTaskCallCount = 0
    var dataTaskArgsRequest: [URLRequest] = []
    
    private func dataTaskWasCalledOnce(file: StaticString = #file, line: UInt = #line) -> Bool {
        verifyMethodCalledOnce(methodName: "dataTask(with:completionHandler:)", callCount: dataTaskCallCount, describeArguments: "request: \(dataTaskArgsRequest)", file: file, line: line)
    }
    
    func verifyDataTask(with request: URLRequest, file: StaticString = #file, line: UInt = #line) {
        guard dataTaskWasCalledOnce(file: file, line: line) else { return }
        XCTAssertEqual(dataTaskArgsRequest.first, request, "request", file: file, line: line)
    }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        return DummyURLSessionDataTask()
    }
}
