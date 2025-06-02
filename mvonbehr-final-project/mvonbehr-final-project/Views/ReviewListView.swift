//
//  ReviewListView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct ReviewListView: View {
    @State private var showSearchPopOver: Bool = false

    var body: some View {
        Text("Reviews")
            .navigationTitle(Text("Reviews"))
            .toolbar {
                Button("Add") {
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
