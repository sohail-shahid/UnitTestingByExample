//
//  NetworkRequestViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 22/08/2023.
//

import XCTest
@testable import UnitTestingByExample

final class NetworkRequestViewControllerTests: XCTestCase {
    var stub: NetworkRequestViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        stub = storyboard.instantiateViewController(identifier: String(describing: NetworkRequestViewController.self)) as? NetworkRequestViewController
    }
    
    override func tearDown() {
        stub = nil
        super.tearDown()
    }
    
    func test_tappingButton_shouldMakeDataTaskToSearchForEBookOutFromBoneville() {
        let mockURLSession = MockURLSession()
        stub.session = mockURLSession
        stub.loadViewIfNeeded()
        stub.searchButton.sendActions(for: .touchUpInside)
        mockURLSession.verifyDataTask(
        with: URLRequest(url: URL(string: "https://itunes.apple.com/search?" +
        "media=ebook&term=out%20from%20boneville")!))
    }
}
