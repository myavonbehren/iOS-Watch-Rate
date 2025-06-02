//
//  ContentView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack{
                ReviewListView()
            }
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Review List")
                    }
                }
                .tag(0)
            NavigationStack{
                WatchListView()
            }
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("Watchlist")
                    }
                }
                .tag(1)
        }
    }
}

#Preview {
    ContentView()
}
