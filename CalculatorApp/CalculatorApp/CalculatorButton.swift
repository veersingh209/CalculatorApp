//
//  CalculatorButton.swift
//  CalculatorApp
//
//  Created by Veer Singh on 8/1/22.
//

import SwiftUI

struct CalculatorButton: View {
    @EnvironmentObject var calcultor: CalculatorLogic
    
    var label: String = ""
    var color: Color = .gray
    var textColor: Color = .white
    
    var body: some View {
        Button(action: {
            calcultor.buttonIsPressed(label: label)
        }, label: {
            ZStack {
                Circle()
                    .fill(color)
                
                Text(label)
                    .font(.system(size: 40.0, weight: .thin))
                    .fontWeight(.medium)
                    .foregroundColor(textColor)
            }
        })
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(label: "1", color: .gray)
            .previewLayout(.fixed(
                width: 100,
                height: 100
            ))
            .environmentObject(CalculatorLogic())
    }
}


