//
//  ReviewListView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct ReviewListView: View {
    var body: some View {
        Text("Reviews")
            .navigationTitle(Text("Reviews"))
            .toolbar {
                Button("Add") {
                    print("Pressed")
                }
            }
    }
}

#Preview {
    ReviewListView()
}
