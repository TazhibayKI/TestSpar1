//
//  PriceFractionRow.swift
//  TestSpar
//
//  Created by Александра Тажибай on 06.02.2024.
//

import SwiftUI

struct PriceFractionRow: View {
    var body: some View {
        HStack {
            Text("р")
                .font(.title3)
                .offset(x: 8, y: -7)
            Text("/")
                .font(.title)
                .rotationEffect(Angle(degrees: 20))
            Text("кг")
                .font(.title3)
                .offset(x: -10, y: 7)
        }
    }
}

#Preview {
    PriceFractionRow()
}
