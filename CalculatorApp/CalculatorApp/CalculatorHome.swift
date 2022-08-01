//
//  CalculatorHome.swift
//  CalculatorApp
//
//  Created by Veer Singh on 8/1/22.
//

import SwiftUI

// Constants
let rowOne =   ["AC", "", "", String("\u{00f7}")]
let rowTwo =   ["7", "8", "9", String("\u{00d7}")]
let rowThree = ["4", "5", "6", "-"]
let rowFour =  ["1", "2", "3", "+"]
let rowFive =  ["0", "", ".", "="]

let rowOneButtonColors: [Color] = [.gray, .gray, .gray, .orange]
let rowOneTextColor: [Color] = [.black, .black, .black, .white]

struct CalculatorHome: View {
    @EnvironmentObject var calculator: CalculatorLogic
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .trailing, spacing: 0) {
                Spacer()
                
                Text(calculator.calculatorDisplayNumber)
                    .fontWeight(.thin)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.system(size: 80))
                    .lineLimit(1)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                
                VStack(spacing: 10) {
                    CalculatorRow(buttonLabels: rowOne, buttonColors: rowOneButtonColors, textColor: rowOneTextColor)
                    CalculatorRow(buttonLabels: rowTwo)
                    CalculatorRow(buttonLabels: rowThree)
                    CalculatorRow(buttonLabels: rowFour)
                    CalculatorRow(buttonLabels: rowFive)
                }
                .frame(height: geometry.size.height * 0.65)
                .padding()
                .padding(.bottom)
            }
        }
        .background(Color("AdaptiveBackground"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct CalculatorHome_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorHome()
            .environmentObject(CalculatorLogic())
            .colorScheme(.light)
    }
}

