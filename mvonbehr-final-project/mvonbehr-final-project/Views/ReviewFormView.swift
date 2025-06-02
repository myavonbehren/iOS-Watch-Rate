//
//  ReviewFormView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct ReviewFormView: View {
    private var show: TVShow
    @State var rating: Int = 1
    @State var review: String = ""
    
    init(show: TVShow) {
        self.show = show
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    RatingView(rating: $rating)
                    TextField("Add a review...", text: $review, axis: .vertical)
                        .lineLimit(10...25)
                }
                
            }
            .navigationTitle("\(show.name) (\(show.yearText))")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        print("Add review button pressed")
                    }
                }
            }
        }
    }
}

#Preview {
    ReviewFormView(show: TVShow.mockTVShow)
}
