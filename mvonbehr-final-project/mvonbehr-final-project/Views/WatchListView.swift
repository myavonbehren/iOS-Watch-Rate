//
//  WatchListView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct WatchListView: View {
    @State private var showSearchPopOver: Bool = false
    
    var body: some View {
        Text("Watchlist")
            .navigationTitle(Text("Watchlist"))
            .toolbar {
                Button("Add to watchlist", systemImage: "plus") {
                    showSearchPopOver = true
                }
            }
            .popover(isPresented: $showSearchPopOver) {
                TVSearchView(mode: .watchlist) { selectedShow in
                    print("Add \(selectedShow.name) to watchlist")
                }
            }
    }
}

#Preview {
    WatchListView()
}
