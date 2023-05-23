//
//  CoveredClass.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 20/05/2023.
//

import UIKit
class CoveredClass {
    
    private(set) var area: Int
    var width: Int {
        didSet {
            area = width * width
            let color: UIColor = redOrGreen(for: width)
            drawSquare(width: width, color: color)
        }
    }

    init() {
        area = 0
        width = 0
    }
    
    private func redOrGreen(for width: Int) -> UIColor {
        width % 2 == 0 ? .red : .green
    }
   
    private func drawSquare(width: Int, color: UIColor) {
    }
    
    static func max(_ x: Int, _ y: Int) -> Int {
        var max = 0
        if x <= y {
            max = y
        } else {
            max = x
        }
        return max
    }
    
    func commaSeparated (from: Int, to: Int) -> String {
        var result = ""
        for i in from ..< to {
            result += "\(i),"
        }
        result += "\(to)"
        return result
    }
}
