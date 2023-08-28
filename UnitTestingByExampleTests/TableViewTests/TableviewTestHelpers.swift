//
//  TableviewTestHelpers.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 28/08/2023.
//

import Foundation
import UIKit

func numberOfRows(in tableView: UITableView, section: Int = 0) -> Int? {
    tableView.dataSource?.tableView(tableView, numberOfRowsInSection: section)
}

func cellForRow(in tableView: UITableView, row: Int, section: Int = 0) -> UITableViewCell? {
    tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(row: row, section: section))
}

