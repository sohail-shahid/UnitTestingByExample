//  NetworkRequestViewController.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 21/08/2023.

import UIKit

extension URLSession: URLSessionProtocol {}

class NetworkRequestViewController: UIViewController {
    
    @IBOutlet private(set) var searchButton: UIButton!
    private var dataTask: URLSessionDataTask?
    var session: URLSessionProtocol = URLSession.shared
    var handleResults: ([SearchResult]) -> Void = { print($0) }
    var results: [SearchResult] = [] {
        didSet {
            handleResults(results)
        }
    }
    
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
            
            var decoded: Search?
            var errorMessage: String?
            
            if let error = error {
                errorMessage = error.localizedDescription
            } else if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                errorMessage = "Response: " + HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
            } else if let data = data {
                do {
                    decoded = try JSONDecoder().decode(Search.self, from: data)
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
            DispatchQueue.main.async { [weak self, errorMessage, decoded] in
                guard let self = self else { return }
                if let decoded = decoded {
                    self.results = decoded.results
                }
                if let errorMessage = errorMessage {
                    self.showError(errorMessage)
                }
                self.dataTask = nil
                self.searchButton.isEnabled = true
            }
        }
        searchButton.isEnabled = false
        dataTask?.resume()
    }
    
    private func showError(_ message: String) {
        let title = "Network problem"
        debugPrint("\(title): \(message)")
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        alert.preferredAction = okAction
        present(alert, animated: true)
    }

}
