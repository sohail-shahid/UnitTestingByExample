//
//  OutletConnectionsViewController.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 18/08/2023.
//

import UIKit

class OutletConnectionsViewController: UIViewController {

    @IBOutlet private(set) var label: UILabel!
    @IBOutlet private(set) var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func buttonTap() {
        print(">> Button was tapped")
        label.text = ">> Button was tapped"
    }

}
