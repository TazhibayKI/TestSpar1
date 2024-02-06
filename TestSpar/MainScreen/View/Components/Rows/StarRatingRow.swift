//
//  StarRatingRow.swift
//  TestSpar
//
//  Created by Александра Тажибай on 06.02.2024.
//

import SwiftUI

struct StarRatingRow: View {
    @State private var rating: Int
    var isEditable: Bool

    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow

    init(rating: Int, isEditable: Bool = true) {
        self._rating = State(initialValue: rating)
        self.isEditable = isEditable
    }

    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    if isEditable {
                        self.rating = number
                    }
                } label: {
                    image(for: number)
                        .foregroundStyle(number > self.rating ? offColor : onColor)
                }
            }
        }
    }

    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

#Preview {
    StarRatingRow(rating: 4, isEditable: false)
}

