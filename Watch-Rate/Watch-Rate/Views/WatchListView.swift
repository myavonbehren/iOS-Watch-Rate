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
                    WatchListDetailView(showId: Int(watched.showID))
                } label : {
                    Text(watched.title ?? "No Title").font(.headline)
                }
            }
            .onDelete(perform: deleteWatch)
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
                newWatch.title = selectedShow.name + " (\(selectedShow.yearText))"
                newWatch.showID = Int32(selectedShow.id)
                try? managedObjectContext.save()
            }
        }
    }
    
    func deleteWatch(at offsets: IndexSet) {
        for offset in offsets {
            let watch = watchlist[offset]
            managedObjectContext.delete(watch)
        }
        try? managedObjectContext.save()
    }
}

#Preview {
    WatchListView()
}
