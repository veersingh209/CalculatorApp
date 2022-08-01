//
//  CalculatorApp.swift
//  CalculatorApp
//
//  Created by Veer Singh on 8/1/22.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorHome()
                .environmentObject(CalculatorLogic())
        }
    }
}
