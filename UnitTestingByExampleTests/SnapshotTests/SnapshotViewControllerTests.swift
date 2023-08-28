//
//  SnapshotViewController.swift
//  UnitTestingByExampleTests
//
//  Created by Sohail Khan on 28/08/2023.
//

import iOSSnapshotTestCase
@testable import UnitTestingByExample

final class SnapshotViewControllerTests: FBSnapshotTestCase {
    var sut: SnapshotViewController!
    override func setUp() {
        super.setUp()
        sut = SnapshotViewController.instantiate()
        recordMode = false
    }
    
    func test_example() {
        FBSnapshotVerifyViewController(sut)
    }
}
