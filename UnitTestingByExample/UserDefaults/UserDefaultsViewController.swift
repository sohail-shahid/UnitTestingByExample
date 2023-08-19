//
//  UserDefaultsViewController.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 20/08/2023.
//

import UIKit

protocol UserDefaultsProtocol {
    mutating func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultName: String) -> Int
}

extension UserDefaults: UserDefaultsProtocol {
}
class UserDefaultsViewController: UIViewController {
    @IBOutlet private(set) var counterLabel: UILabel!
    @IBOutlet private(set) var incrementButton: UIButton!
    var userDefault: UserDefaultsProtocol = UserDefaults.standard
    
    private var count = 0 {
        didSet {
            counterLabel.text = "\(count)"
            userDefault.set(count, forKey: "count")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = userDefault.integer(forKey: "count")
    }
    
    @IBAction private func incrementButtonTapped() {
        count += 1
    }
}
