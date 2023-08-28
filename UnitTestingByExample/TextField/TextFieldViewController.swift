//
//  TextFieldViewController.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 25/08/2023.
//

import UIKit

class TextFieldViewController: UIViewController, Storyboarding {
    @IBOutlet private(set) var usernameField: UITextField!
    @IBOutlet private(set) var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func performLogin(username: String, password: String) {
        debugPrint("Username: \(username)")
        debugPrint("Password: \(password)")
    }
    
    deinit {
        print("TextFieldViewController.deinit")
    }
}

extension TextFieldViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField === usernameField {
            return !string.contains(" ")
        } else {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameField {
            passwordField.becomeFirstResponder()
        } else {
            guard let username = usernameField.text, let password = passwordField.text else { return false }
            passwordField.resignFirstResponder()
            performLogin(username: username, password: password)
        }
        return false
    }
}
