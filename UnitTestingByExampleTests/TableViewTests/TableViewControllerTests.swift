//
//  TableViewControllerTests.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 28/08/2023.
//

import XCTest
@testable import UnitTestingByExample

final class TableViewControllerTests: XCTestCase {
    var sut: TableViewController!
    override func setUp() {
        super.setUp()
        sut = TableViewController.instantiate()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_tableViewDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.tableView.delegate, "tableview delegate should not be nil")
        XCTAssertNotNil(sut.tableView.dataSource, "tableview datasource should not be nil")
    }
    
    func test_tableViewDataSource_numberOfRowsInSection_shouldBe3() {
        XCTAssertEqual(numberOfRows(in: sut.tableView, section: 0), 3, "numer of rows in section 0 should be 3")
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToOne() {
        let cell =  cellForRow(in: sut.tableView, row: 0, section: 0)
        XCTAssertEqual(cell?.textLabel?.text, "One")
    }
    
    func test_cellForRowAt_withRow1_shouldSetCellLabelToTwo() {
        let cell =  cellForRow(in: sut.tableView, row: 1, section: 0)
        XCTAssertEqual(cell?.textLabel?.text, "Two")
    }
    
    func test_didSelectRow_withRow1() {
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: IndexPath(row: 1, section: 0))
        // Normally, assert something
    }
}
