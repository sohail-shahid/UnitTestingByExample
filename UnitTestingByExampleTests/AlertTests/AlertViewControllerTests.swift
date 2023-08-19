//
//  AlertViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 18/08/2023.
//

import XCTest
import ViewControllerPresentationSpy
@testable import UnitTestingByExample

final class AlertViewControllerTests: XCTestCase {
    private var sut: AlertViewController!
    private var alertVerifier: AlertVerifier!
    
    @MainActor override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: AlertViewController.self))
        sut.loadViewIfNeeded()
        
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    @MainActor func test_tappingButton_shouldShowAlert() {
        sut.button.sendActions(for: .touchUpInside)
        alertVerifier.verify(title: "Do the Thing?",
                             message: "Let us know if you want to do the thing.",
                             animated: true,
                             actions: [
                                .cancel("Cancel"),
                                .default("OK"),
                             ],
                             presentingViewController: sut)
        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK","preferred action")
    }
    
    @MainActor func test_executeAlertAction_withOKButton() throws {
        sut.button.sendActions(for: .touchUpInside)
        try alertVerifier.executeAction(forButton: "OK")
    }
}
