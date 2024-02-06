//
//  ProductRow.swift
//  TestSpar
//
//  Created by Александра Тажибай on 06.02.2024.
//

import SwiftUI

struct ProductRow: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            Text(product.name)
            Spacer()
            Image(product.image)
                .resizable()
                .frame(width: 40, height: 40)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.regularMaterial)
        .cornerRadius(10)
    }
}

