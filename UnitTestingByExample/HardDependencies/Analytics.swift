//
//  Analytics.swift
//  UnitTestingByExample
//
//  Created by SOHAIL KHAN on 28/05/2023.
//

import Foundation

class Analytics {
    static let shared = Analytics()
    
    func track(event: String) {
        print(">> " + event)
        if self !== Analytics.shared {
            print(">> ...Not the Analytics singleton")
        }
    }
}
