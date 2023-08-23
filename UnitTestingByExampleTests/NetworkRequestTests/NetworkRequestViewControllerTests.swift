//
//  NetworkRequestViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 22/08/2023.
//

import XCTest
import ViewControllerPresentationSpy
@testable import UnitTestingByExample

final class NetworkRequestViewControllerTests: XCTestCase {
    private var alertVerifier: AlertVerifier!
    var stub: NetworkRequestViewController!
    var mockURLSession: MockURLSession!
    
    @MainActor override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        stub = storyboard.instantiateViewController(identifier: String(describing: NetworkRequestViewController.self)) as? NetworkRequestViewController
        mockURLSession = MockURLSession()
        stub.session = mockURLSession
        stub.loadViewIfNeeded()
    }
    
    override func tearDown() {
        alertVerifier = nil
        stub = nil
        mockURLSession = nil
        super.tearDown()
    }
    
    func test_tappingButton_shouldMakeDataTaskToSearchForEBookOutFromBoneville() {
        stub.searchButton.sendActions(for: .touchUpInside)
        mockURLSession.verifyDataTask(
            with: URLRequest(url: URL(string: "https://itunes.apple.com/search?" +
                                      "media=ebook&term=out%20from%20boneville")!))
    }
    
    func test_searchForBookNetworkCall_withSuccessResponse_shouldSaveDataInResults() {
        stub.searchButton.sendActions(for: .touchUpInside)
        let handleResultsCalled = expectation(description: "handleResults called")
        stub.handleResults = { _ in
            handleResultsCalled.fulfill()
        }
        mockURLSession.dataTaskArgsCompletionHandler.first?( jsonData(), response(statusCode: 200), nil)
        waitForExpectations(timeout: 0.01)
        XCTAssertEqual(stub.results, [SearchResult(artistName: "Artist", trackName: "Track", averageUserRating: 2.5, genres: ["Foo", "Bar"])])
    }
    
    func test_searchForBookNetworkCall_withSuccessBeforeAsync_shouldNotSaveDataInResults() {
        stub.searchButton.sendActions(for: .touchUpInside)
        mockURLSession.dataTaskArgsCompletionHandler.first?( jsonData(), response(statusCode: 200), nil)
        XCTAssertEqual(stub.results, [])
    }
    
    @MainActor func test_searchForBookNetworkCall_withError_shouldShowAlert() {
        stub.searchButton.sendActions(for: .touchUpInside)
        let expectation = expectation(description: "alert shown")
        alertVerifier.testCompletion = {
            expectation.fulfill()
        }
        mockURLSession.dataTaskArgsCompletionHandler.first?( nil, nil, TestError(message: "oh no"))
        waitForExpectations(timeout: 0.01)
        verifyErrorAlert(message: "oh no")
    }
    
    @MainActor func test_searchForBookNetworkCall_withErrorPreAsync_shouldNotShowAlert() {
        stub.searchButton.sendActions(for: .touchUpInside)
        mockURLSession.dataTaskArgsCompletionHandler.first?(nil, nil, TestError(message: "DUMMY"))
        XCTAssertEqual(alertVerifier.presentedCount, 0)
        
    }
    
    func test_searchForBookNetworkCall_beforeResponse_buttonShouldBeDisable() {
        stub.searchButton.sendActions(for: .touchUpInside)
        XCTAssertTrue(stub.searchButton.isEnabled == false, "Button should be disable")
    }
    
    func test_searchForBookNetworkCall_afterResponse_buttonShouldNotBeDisable() {
        stub.searchButton.sendActions(for: .touchUpInside)
        let requestCompelteExpectation = expectation(description: "alert shown")
        stub.handleResults = { _ in
            requestCompelteExpectation.fulfill()
        }
        mockURLSession.dataTaskArgsCompletionHandler.first?( jsonData(), response(statusCode: 200), nil)
        waitForExpectations(timeout: 0.01)
        XCTAssertTrue(stub.searchButton.isEnabled == true, "Button should be disable")
    }
    
    private func response(statusCode: Int) -> HTTPURLResponse? {
        HTTPURLResponse(url: URL(string: "http://DUMMY")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
    }
    private func jsonData() -> Data {
    """
    {
      "results": [
        {
          "artistName": "Artist",
          "trackName": "Track",
          "averageUserRating": 2.5,
          "genres": [
            "Foo",
            "Bar"
          ]
        }
      ]
    }
    """.data(using: .utf8)!
    }
    
    @MainActor private func verifyErrorAlert(message: String, file: StaticString = #file, line: UInt = #line) {
        alertVerifier.verify(title: "Network problem", message: message, animated: true, actions: [.default("OK")], presentingViewController: stub, file: file, line: line)
        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK", "preferred action", file: file, line: line)
    }
}
