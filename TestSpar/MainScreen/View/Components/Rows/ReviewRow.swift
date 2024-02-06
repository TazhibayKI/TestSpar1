//
//  ReviewRow.swift
//  TestSpar
//
//  Created by Александра Тажибай on 06.02.2024.
//

import SwiftUI

struct ReviewRow: View {
    
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(review.name)
                .bold()
            Text(review.date)
                .foregroundStyle(.gray)
            StarRatingRow(rating: review.raiting, isEditable: false)
            Text(review.description)
                .font(.caption)
        }
        .frame(width: 210, height: 130)
        .padding()
        .background()
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.15), radius: 10)
    }
}

#Preview {
    ReviewRow(review: Product.mockData()[0].reviews.review[0])
}
