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
        Text("Review Count: \(reviews.count)")
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
