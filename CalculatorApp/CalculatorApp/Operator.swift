//
//  Operator.swift
//  CalculatorApp
//
//  Created by Veer Singh on 8/1/22.
//

import Foundation

class Operator {
    var operation: (Double, Double) -> Double
    var usingDivison = false
    
    init(_ string: String) {
        switch string {
        case "+":
            self.operation = (+)
        case "-":
            self.operation = (-)
        case String("\u{00d7}"):
            self.operation = (*)
        default:
            self.usingDivison = true
            self.operation = (/)
        }
    }
}
