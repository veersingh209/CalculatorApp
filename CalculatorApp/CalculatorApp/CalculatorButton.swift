//
//  CalculatorButton.swift
//  CalculatorApp
//
//  Created by Veer Singh on 8/1/22.
//

import SwiftUI

struct CalculatorButton: View {
    var label: String = " "
    var color: Color = .gray
    var textColor: Color = .white
    var textSize = 40.0
    
    var body: some View {
        Button(action: {
            // Need to implement
        }, label: {
            ZStack {
                Circle()
                    .fill(color)
                
                Text(label)
                    .font(.system(size: textSize, weight: .thin))
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
    }
}


