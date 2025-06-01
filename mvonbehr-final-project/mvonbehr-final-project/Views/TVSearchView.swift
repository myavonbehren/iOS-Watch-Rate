//
//  TVSearchView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/30/25.
//

import SwiftUI

struct TVSearchView: View {
    @StateObject var tvSearchState = TVShowSearchState()
    
    var body: some View {
        List {
            ForEach(tvSearchState.tvShows) { tvShow in
                NavigationLink(destination: ReviewFormView(showId: tvShow.id)){
                    TVShowRowView(tvShow: tvShow).padding(.vertical, 8)
                }
            }
        }
        .searchable(text: $tvSearchState.query, prompt: "Search TV Shows")
        .overlay(content: <#T##() -> View#>)
        .onAppear{
            self.tvSearchState.startObserve()
        }
        .navigationTitle(Text("Search TV Shows"))
    }
    
    @ViewBuilder
    private var overlayView: some View {
        switch tvSearchState.phase {
        case .empty:
            if tvSearchState.trimmedQuery.isEmpty {
               
            }
        }
    }
    
}

struct TVShowRowView: View {
    let tvShow: TVShow
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading) {
                Text(tvShow.name)
                    .font(.headline)
                
                Text(tvShow.yearText)
                    .font(.subheadline)
                Spacer()
            }
        }
        
    }
}

#Preview {
    TVSearchView()
}
