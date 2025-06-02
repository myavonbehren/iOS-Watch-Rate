//
//  WatchListView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct WatchListView: View {
    var body: some View {
        Text("Watch List")
            .navigationTitle(Text("Watch List"))
            .toolbar {
                Button("Add") {
                    print("Pressed")
                }
            }
    }
}

#Preview {
    WatchListView()
}
