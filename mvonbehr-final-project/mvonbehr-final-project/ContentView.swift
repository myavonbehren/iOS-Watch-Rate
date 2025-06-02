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
            
            ReviewListView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Reviews")
                    }
                }
                .tag(0)

            WatchListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("Watch List")
                    }
                }
                .tag(1)
            
        }
    }
}

#Preview {
    ContentView()
}
