//
//  PasswordChanger.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 29/08/2023.
//

import Foundation


private struct SuccessOrFailureTimer {
    let onSuccess: () -> Void
    let onFailure: (String) -> Void
    let timer: Timer
}

protocol PasswordChangerProtocol {
    func change(securityToken: String, oldPassword: String, newPassword: String,
                onSuccess: @escaping () -> Void,
                onFailure: @escaping (String) -> Void)
}

final class PasswordChanger: PasswordChangerProtocol {
    
    private static var pretendToSucceed = false
    private var successOrFailureTimer: SuccessOrFailureTimer?
    
    func change(securityToken: String, oldPassword: String, newPassword: String,
                onSuccess: @escaping () -> Void,
                onFailure: @escaping (String) -> Void) {
        print("Initiate Change Password:")
        print("securityToken = \(securityToken)")
        print("oldPassword = \(oldPassword)")
        print("newPassword = \(newPassword)")
        successOrFailureTimer = SuccessOrFailureTimer(onSuccess: onSuccess, onFailure: onFailure, timer: Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] _ in
            self?.callSuccessOrFailure()
        })
    }
    
    private func callSuccessOrFailure() {
        if PasswordChanger.pretendToSucceed {
            successOrFailureTimer?.onSuccess()
        } else {
            successOrFailureTimer?.onFailure("Sorry, something went wrong.")
        }
        PasswordChanger.pretendToSucceed.toggle()
        successOrFailureTimer?.timer.invalidate()
        successOrFailureTimer = nil
    }
}
