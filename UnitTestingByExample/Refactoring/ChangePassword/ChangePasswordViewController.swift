//
//  ChangePasswordViewController.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 29/08/2023.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet private(set) var cancelBarButton: UIBarButtonItem!
    @IBOutlet private(set) var oldPasswordTextField: UITextField!
    @IBOutlet private(set) var newPasswordTextField: UITextField!
    @IBOutlet private(set) var confirmPasswordTextField: UITextField!
    @IBOutlet private(set) var submitButton: UIButton!
    @IBOutlet private(set) var navigationBar: UINavigationBar!
    
    lazy var passwordChanger: PasswordChangerProtocol = PasswordChanger()
    var securityToken = ""
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    deinit {
        debugPrint("deinit ChangePasswordViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor(red: 55/255.0, green: 147/255.0, blue: 251/255.0, alpha: 1).cgColor
        submitButton.layer.cornerRadius = 8
        blurView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
    }
    
    @IBAction private func cancel() {
        oldPasswordTextField.resignFirstResponder()
        newPasswordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        dismiss(animated: true)
    }
    
    @IBAction private func changePassword() {
        let isValidInput = validateInputs()
        if isValidInput {
            setUpWaitingAppearance()
            attemptToChangePassword()
        }
    }
        
    private func validateInputs() -> Bool {
        if oldPasswordTextField.text?.isEmpty ?? true {
            oldPasswordTextField.becomeFirstResponder()
            return false
        }

        let title = "Error"
        if newPasswordTextField.text?.isEmpty ?? true {
            let okAction: (UIAlertAction) -> Void = { [weak self] _ in self?.newPasswordTextField.becomeFirstResponder()
            }
            showAlert(title, "Please enter a new password.", okAction)
            return false
        }
        if newPasswordTextField.text?.count ?? 0 < 6 {
            let okAction: (UIAlertAction) -> Void = { [weak self] _ in
                self?.resetNewPasswords()
            }
            showAlert(title, "The new password should have at least 6 characters.", okAction)
            return false
        }
        if newPasswordTextField.text != confirmPasswordTextField.text {
            let okAction: (UIAlertAction) -> Void = { [weak self] _ in
                self?.resetNewPasswords()
            }
            showAlert(title, "The new password and the confirmation password " + "don’t match. Please try again.", okAction)
            return false
        }
        return true
    }
    
    private func setUpWaitingAppearance() {
        self.view.endEditing(true)
        cancelBarButton.isEnabled = false
        view.backgroundColor = .clear
        view.addSubview(blurView)
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),])
        activityIndicator.startAnimating()
    }

    private func attemptToChangePassword() {
        passwordChanger.change(securityToken: securityToken, oldPassword: oldPasswordTextField.text ?? "", newPassword: newPasswordTextField.text ?? "", onSuccess: { [weak self] in
            self?.hideSpinner()
            let okAction: (UIAlertAction) -> Void = { [weak self] _ in
                self?.dismiss(animated: true)
            }
            self?.showAlert("success", "Your password has been successfully changed.", okAction)
        }, onFailure: { [weak self] message in
            self?.hideSpinner()
            let title = "Error"
            let okAction: (UIAlertAction) -> Void = { [weak self] _ in
                self?.oldPasswordTextField.text = ""
                self?.newPasswordTextField.text = ""
                self?.confirmPasswordTextField.text = ""
                self?.oldPasswordTextField.becomeFirstResponder()
                self?.view.backgroundColor = .white
                self?.blurView.removeFromSuperview()
                self?.cancelBarButton.isEnabled = true
            }
            self?.showAlert(title, message, okAction)
        })
    }
    
    private func resetNewPasswords() {
        newPasswordTextField.text = ""
        confirmPasswordTextField.text = ""
        newPasswordTextField.becomeFirstResponder()
    }
    
    private func showAlert(_ title: String, _ message: String, _ okAction: @escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction( title: "OK", style: .default, handler: okAction)
        alertController.addAction(okButton)
        alertController.preferredAction = okButton
        self.present(alertController, animated: true)
    }
    
    private func hideSpinner() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
    }
}

extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === oldPasswordTextField {
            newPasswordTextField.becomeFirstResponder()
        } else if textField === newPasswordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        } else if textField === confirmPasswordTextField {
            changePassword()
        }
        return true
    }
}

extension ChangePasswordViewController: Storyboarding {
}
