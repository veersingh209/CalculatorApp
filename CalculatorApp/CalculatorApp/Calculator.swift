//
//  Calculator.swift
//  CalculatorApp
//
//  Created by Veer Singh on 8/1/22.
//

import Foundation

class Calculator: ObservableObject {
    @Published var calculatorDisplayNumber = "0"
    
    var currentOperator: Operation?
    var previousSelectedNumber: Double?
    var currentNumberSelected: Double? = 0
    var numberOfDecimalPlaces = 0
    var equalsPressed = false
    
    func buttonIsPressed(label: String) {
        switch label {
        case "AC":
            clearCalculator()
        case "=":
            equalsButtonPressed()
        case ".":
            decimalButtonPressed()
        default:
            operationPressed(operation: Operation())
        }
    }
    
    func clearCalculator() {
        calculatorDisplayNumber = "0"
        currentOperator = nil
        previousSelectedNumber = nil
        currentNumberSelected = 0
        numberOfDecimalPlaces = 0
        equalsPressed = false
    }
    
    func equalsButtonPressed() {
        
    }
    
    func decimalButtonPressed() {
        
    }
    
    func numberPressed(value: Double) {
        
    }
    
    func operationPressed(operation: Operation) {
        
    }
}
