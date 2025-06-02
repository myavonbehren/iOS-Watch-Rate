//
//  ReviewListView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct ReviewListView: View {
    @State private var showSearchPopOver: Bool = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var reviews: FetchedResults<Review>
    
    var body: some View {
        List {
            ForEach(reviews) { review in
                NavigationLink {
                    EmptyView()
                    //ReviewDetailView(show: show)
                } label : {
                        VStack(alignment: .leading) {
                            Text(review.title ?? "No Title").font(.headline)
                    }
                }
            }
        }
            .navigationTitle(Text("Reviews"))
            .toolbar {
                Button("Add Review", systemImage: "plus") {
                    showSearchPopOver = true
                }
            }
            .popover(isPresented: $showSearchPopOver) {
                TVSearchView(mode: .review, onShowSelected: nil)
            }
    }
}

#Preview {
    ReviewListView()
}
