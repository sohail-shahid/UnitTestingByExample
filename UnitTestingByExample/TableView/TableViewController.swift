//
//  TableViewController.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 28/08/2023.
//

import UIKit

class TableViewController: UITableViewController {
    private let model = [ "One", "Two", "Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(model[indexPath.row])
    }
}

extension TableViewController: Storyboarding {}
