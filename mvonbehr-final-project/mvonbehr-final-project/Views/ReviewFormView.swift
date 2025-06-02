//
//  ReviewFormView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct ReviewFormView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    private var show: TVShow
    @State var rating: Int = 0
    @State var review: String = ""
    
    init(show: TVShow) {
        self.show = show
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    HStack {
                        TVShowPosterView(show: show)
                            .frame(width: 50, height: 75)
                        Text(" \(show.name) (\(show.yearText))")
                            .bold(true)
                            .font(.title2)
                    }
                    RatingView(rating: $rating)
                    TextField("Add a review...", text: $review, axis: .vertical)
                        .lineLimit(10...25)
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newReview = Review(context: managedObjectContext)
                        newReview.id = UUID()
                        newReview.rating = Int16(rating)
                        newReview.content = review
                        newReview.title = show.name
                        try? managedObjectContext.save()
                        dismiss()
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ReviewFormView(show: TVShow.mockTVShow)
}
