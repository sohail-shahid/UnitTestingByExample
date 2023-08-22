//  NetworkRequestViewController.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 21/08/2023.

import UIKit

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

class NetworkRequestViewController: UIViewController {
    
    @IBOutlet private(set) var searchButton: UIButton!
    private var dataTask: URLSessionDataTask?
    var session: URLSessionProtocol = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func searchButtonPressed() {
        searchForBook(terms: "out from boneville")
    }
    
    
    private func searchForBook(terms: String) {
        guard let encodedTerms = terms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: "https://itunes.apple.com/search?" + "media=ebook&term=\(encodedTerms)") else { return }
        let request = URLRequest(url: url)
        dataTask = session.dataTask(with: request) { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let self = self else { return }
            let decoded = String(data: data ?? Data(), encoding: .utf8)
            
            print("response: \(String(describing: response))")
            print("data: \(String(describing: decoded))")
            print("error: \(String(describing: error))")
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.dataTask = nil
                self.searchButton.isEnabled = true
            }
            
        }
        searchButton.isEnabled = false
        dataTask?.resume() }
}
