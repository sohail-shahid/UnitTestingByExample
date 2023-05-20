//
//  MyClass.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 19/05/2023.
//

import Foundation

class MyClass {
    private static var allInstances = 0
    private let instance: Int
    init() {
        MyClass.allInstances += 1
        instance = MyClass.allInstances
        print(">> MyClass.init() #\(instance)")
    }
    
    deinit {
        print(">> MyClass.deinit #\(instance)")
    }
    func methodOne() {
        print(">> methodOne")
    }
    func methodTwo() {
        print(">> methodTwo")
    }
}
