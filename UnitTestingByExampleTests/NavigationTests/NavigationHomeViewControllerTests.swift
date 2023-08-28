//
//  NavigationHomeViewController.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 19/08/2023.
//

import XCTest
import ViewControllerPresentationSpy
@testable import UnitTestingByExample

final class NavigationHomeViewControllerTests: XCTestCase {
    
    var sut: NavigationHomeViewController!
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: NavigationHomeViewController.self)) as? NavigationHomeViewController
        sut.loadViewIfNeeded()

    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_onLoadVc_shouldNotBeNavViewControllerNil() {
        let _ = UINavigationController(rootViewController: sut)
        XCTAssertNotNil(sut.navigationController)
    }
    
    func test_tappingCodePushButton_shouldHaveTwoVCsInStack() {
        let navigation = UINavigationController(rootViewController: sut)
        sut.codePushButton.sendActions(for: .touchUpInside)
        executeRunLoop()
        
        XCTAssertEqual(navigation.viewControllers.count, 2, "navigation stack")
    }
    
    func test_tappingCodePushButton_shouldPushCodeNextViewController() {
        let navigation = UINavigationController(rootViewController: sut)
        sut.codePushButton.sendActions(for: .touchUpInside)
        executeRunLoop()
                
        let pushedVC = navigation.viewControllers.last
        XCTAssertTrue(pushedVC is CodeNextViewController, "Expected CodeNextViewController, " + "but was \(String(describing: pushedVC))")
    }
        
    @MainActor func test_tappingCodeModalButton_shouldPresentCodeNextViewController() {
        let presentationVerifier = PresentationVerifier()
        sut.codeModalButton.sendActions(for: .touchUpInside)
        let codeNextVC: CodeNextViewController? = presentationVerifier.verify( animated: true, presentingViewController: sut)
        XCTAssertEqual(codeNextVC?.label.text, "Modal from code")
    }
    
    func test_tappingSeguePushButton_shouldShowSegueNextViewController() {
        let navigation = UINavigationController(rootViewController: sut)
        sut.seguePushButton.sendActions(for: .touchUpInside)
        executeRunLoop()

        let segueNextVC = navigation.viewControllers.last
        XCTAssertTrue(segueNextVC is SegueNextViewController, "Expected CodeNextViewController, " + "but was \(String(describing: segueNextVC))")
        // XCTAssertEqual(segueNextVC?.labelText, "Pushed from segue")
    }
    
    func test_tappingSeguePushButton_shouldHaveLabelTitle() {
        let navigation = UINavigationController(rootViewController: sut)
        sut.seguePushButton.sendActions(for: .touchUpInside)
        executeRunLoop()

        let segueNextVC = navigation.viewControllers.last as? SegueNextViewController
        XCTAssertEqual(segueNextVC?.labelText, "Pushed from segue")
    }
    
    @MainActor func test_tappingSegueModalButton_shouldShowSegueNextViewController() {
        let presentationVerifier = PresentationVerifier()
        sut.segueModalButton.sendActions(for: .touchUpInside)
        let segueNextVC: SegueNextViewController? = presentationVerifier.verify( animated: true, presentingViewController: sut)
        XCTAssertEqual(segueNextVC?.labelText, "Modal from segue")
    }
}
