//
//  URLSessionProtocol.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 22/08/2023.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
