//
//  TextFieldViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 25/08/2023.
//

import XCTest
@testable import UnitTestingByExample

final class TextFieldViewControllerTests: XCTestCase {
    var sut: TextFieldViewController!
    
    override func setUp() {
        super.tearDown()
        sut = TextFieldViewController.instantiate()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }
    
    func test_outlets_shouldNotBeNil() {
        XCTAssertNotNil(sut.usernameField, "usernameField should not be nil")
        XCTAssertNotNil(sut.passwordField, "usernameField should not be nil")
    }
    
    func test_usernameField_attributShouldBeSet() {
        let textField = sut.usernameField!
        XCTAssertEqual(textField.returnKeyType, .next, "username textfield should be next")
        XCTAssertEqual(textField.autocorrectionType, .no, "username textfield auto correction should be disable")
        XCTAssertEqual(textField.textContentType, .username, "username textfield text content type should be username")

    }
    
    func test_passwordField_attributeShouldBeSet() {
        let textField = sut.passwordField!
        XCTAssertEqual(textField.returnKeyType, .go, "password textfield should be go")
        XCTAssertEqual(textField.textContentType, .password, "password textfield text content type should be password")
        XCTAssertTrue(textField.isSecureTextEntry, "password field should be sceure entry")

    }
    
    func test_textFieldsDelegate_ShouldNotBeNil() {
        XCTAssertNotNil(sut.usernameField.delegate, "username textfield delegate should not nil")
        XCTAssertNotNil(sut.passwordField.delegate, "password textfield delegate should not nil")
    }
    
    func test_shouldChangeCharactersUsernameWithSpace_shouldPreventChange() {
        let textField = sut.usernameField!
        let allowChange = shouldChangeCharacters(in: textField, range: NSRange(), replacement: "I am")
        XCTAssertEqual(allowChange, false, "result should be false")
    }
    
    func test_shouldChangeCharactersUsernameWithoutSpaces_shouldAllowChange() {
        let allowChange = shouldChangeCharacters(in: sut.usernameField, replacement: "abc")
        XCTAssertEqual(allowChange, true)
    }
    
    func test_shouldChangeCharactersPasswordWithSpaces_shouldAllowChange() {
        let allowChange = shouldChangeCharacters(in: sut.passwordField, replacement: "123 awa")
        XCTAssertEqual(allowChange, true)
    }
    
    func test_shouldChangeCharactersPasswordWithOutSpaces_shouldAllowChange() {
        let allowChange = shouldChangeCharacters(in: sut.passwordField, replacement: "123awa")
        XCTAssertEqual(allowChange, true)
    }
    
    func test_shouldReturnWithUsername_shouldMoveKeyboardFocusToPassword() {
        putInViewHierarchy(sut)
        shouldReturn(in: sut.usernameField)
        XCTAssertTrue(sut.passwordField.isFirstResponder)
    }
    
    func test_shouldReturnWithPasswordField_shouldPerfromLogin() {
        sut.usernameField.text = "USERNAME"
        sut.passwordField.text = "PASSWORD"
        shouldReturn(in: sut.passwordField)
        // Normally, assert something
    }
    
    func test_shouldReturnWithPassword_shouldDismissKeyboard() {
        putInViewHierarchy(sut)
        sut.passwordField.becomeFirstResponder()
        XCTAssertTrue(sut.passwordField.isFirstResponder, "precondition")
        shouldReturn(in: sut.passwordField)
        XCTAssertFalse(sut.passwordField.isFirstResponder)
    }
}
