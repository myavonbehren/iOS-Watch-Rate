//
//  WatchListView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct WatchListView: View {
    @State private var showSearchPopOver: Bool = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var watchlist: FetchedResults<Watch>
    
    
    var body: some View {
        List {
            ForEach(watchlist) { watched in
                NavigationLink {
                    EmptyView()
                    //WatchListDetailView(showId: Int($watchlist.showID))
                } label : {
                    Text(watched.title ?? "No Title").font(.headline)
                }
            }
        }
        .navigationTitle(Text("Watchlist"))
        .toolbar {
            Button("Add to watchlist", systemImage: "plus") {
                showSearchPopOver = true
            }
        }
        .popover(isPresented: $showSearchPopOver) {
            TVSearchView(mode: .watchlist) { selectedShow in
                let newWatch = Watch(context: managedObjectContext)
                newWatch.id = UUID()
                newWatch.title = selectedShow.name
                newWatch.showID = Int32(selectedShow.id)
                try? managedObjectContext.save()
            }
        }
    }
}

#Preview {
    WatchListView()
}
