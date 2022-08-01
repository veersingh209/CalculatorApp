//
//  CalculatorLogic.swift
//  CalculatorApp
//
//  Created by Veer Singh on 8/1/22.
//

import Foundation

func pow(_ base: Int, _ exp: Int) -> Double {
    return pow(Double(base), Double(exp))
}

class CalculatorLogic: ObservableObject {
    @Published var calculatorDisplayNumber = "0"
    
    var currentOperator: Operator?
    var currentNumberSelected: Double? = 0
    var previousSelectedNumber: Double?
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
            if let value = Double(label) {
                numberPressed(value: value)
            } else {
                operationPressed(operation: Operator(label))
            }
        }
    }
    
    func updateDisplayNumber(number: Double) {
        // Hide decimal if not needed
        if number == floor(number) {
            calculatorDisplayNumber = "\(Int(number))"
        } else {
            let decimalPlaces = 10
            calculatorDisplayNumber = "\(round(pow(10, decimalPlaces) * number) / pow(10, decimalPlaces))"
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
        // equalsPressed = true
    }
    
    func decimalButtonPressed() {
        
    }
    
    func numberPressed(value: Double) {
        if equalsPressed {
            currentNumberSelected = nil
            previousSelectedNumber = nil
            equalsPressed = false
        }
        
        if currentNumberSelected == nil {
            currentNumberSelected = value / pow(10, numberOfDecimalPlaces)
        } else {
            if numberOfDecimalPlaces == 0 {
                currentNumberSelected = currentNumberSelected! * 10 + value
            } else {
                currentNumberSelected = currentNumberSelected! + value / pow(10, numberOfDecimalPlaces)
                numberOfDecimalPlaces += 1
            }
        }
        
        // Update UI
        updateDisplayNumber(number: currentNumberSelected!)
    }
    
    func operationPressed(operation: Operator) {
        numberOfDecimalPlaces = 0
        
        // Clear if equal pressed
        if equalsPressed {
            currentNumberSelected = nil
            equalsPressed = false
        }
        
        // When using multiple operands
        if currentNumberSelected != nil && previousSelectedNumber != nil {
            let total = currentOperator!.operation(
                previousSelectedNumber!, currentNumberSelected!
            )
            previousSelectedNumber = total
            currentNumberSelected = nil
            
            // Update UI
            updateDisplayNumber(number: total)
            
        } else if previousSelectedNumber == nil {
            previousSelectedNumber = currentNumberSelected
            currentNumberSelected = nil
        }
        
        currentOperator = operation
        
    }
}
