//
//  FakeUserDefaults.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 20/08/2023.
//

import Foundation
@testable import UnitTestingByExample

struct FakeUserDefaults {
    var integers: [String: Int] = [:]
}

extension FakeUserDefaults: UserDefaultsProtocol {
    mutating func set(_ value: Int, forKey defaultName: String) {
        integers[defaultName] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        return integers[defaultName] ?? 0
    }
    
    
}
