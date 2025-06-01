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
                    
                }
            }
        }
        .onAppear{
            self.tvSearchState.startObserve()
        }
        .navigationTitle(Text("Search TV Shows"))
    }
    
}

struct TVShowRowView: View {
    let tvShow: TVShow
    
    var body: some View {
        
    }
}

#Preview {
    TVSearchView()
}
