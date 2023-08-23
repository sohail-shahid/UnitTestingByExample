//
//  TestError.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 23/08/2023.
//

import Foundation

struct TestError: LocalizedError {
    let message: String
    var errorDescription: String? { message }
}
