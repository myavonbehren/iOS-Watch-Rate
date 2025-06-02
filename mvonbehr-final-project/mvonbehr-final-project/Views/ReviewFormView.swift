//
//  ReviewFormView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct ReviewFormView: View {
    private var show: TVShow
    @State var rating: String = ""
    @State var review: String = ""
    
    init(show: TVShow) {
        self.show = show
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    Picker("Rating", selection: $rating) {
                        ForEach(1..<6) { value in
                            Text(String(value)).tag(Int16(value))
                        }
                    }
                    TextField("Add a review...", text: $review, axis: .vertical)
                        .lineLimit(15...30)
                }
                Section {
                    Button("Save") {
                        print("save pressed")
                    }
                }
                
            }
            .navigationTitle("\(show.name) (\(show.yearText))")
        }
    }
}

#Preview {
    ReviewFormView(show: TVShow.mockTVShow)
}
