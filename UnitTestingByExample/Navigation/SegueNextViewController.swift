//
//  SegueNextViewController.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 19/08/2023.
//

import UIKit

class SegueNextViewController: UIViewController {
    var labelText: String?
    @IBOutlet private(set) var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }
    
    deinit {
        debugPrint("deinit \(String(describing: self))")
    }
}
