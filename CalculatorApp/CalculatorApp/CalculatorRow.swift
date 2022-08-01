//
//  CalculatorRow.swift
//  CalculatorApp
//
//  Created by Veer Singh on 8/1/22.
//

import SwiftUI
// Custom Colors
let darkerGray = Color(CGColor(gray: 0.1, alpha: 1))

struct CalculatorRow: View {
    var buttonLabels = ["", "", "", ""]
    var buttonColors: [Color] = [darkerGray, darkerGray, darkerGray, .orange]
    var textColor: [Color] = [.white, .white, .white, .white]
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<4){ i in
                CalculatorButton(
                    label: buttonLabels[i],
                    color: buttonColors[i],
                    textColor: textColor[i]
                )
            }
        }
    }
}

struct CalculatorRow_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorRow(buttonLabels: ["1", "2", "3", "+"])
            .previewLayout(.fixed(width: 400, height: 100))
    }
}


