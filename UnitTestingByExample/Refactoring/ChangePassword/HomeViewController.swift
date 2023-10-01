//
//  HomeViewController.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 29/08/2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "changePassword" {
            let changePasswordVC = segue.destination as? ChangePasswordViewController
            changePasswordVC?.securityToken = "TOKEN"
        }
    }
}
