//
//  TVSearchView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/30/25.
//

import SwiftUI

struct TVSearchView: View {
    @StateObject var tvSearchState = TVShowSearchState()
    let mode: SearchMode
    let onShowSelected: ((TVShow) -> Void)?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(tvSearchState.tvShows) { tvShow in
                    rowView(for: tvShow)
                }
            }
            .searchable(text: $tvSearchState.query, prompt: "Search TV Shows")
            .overlay(overlayView)
            .onAppear{
                self.tvSearchState.startObserve()
            }
            .navigationTitle(mode.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        switch tvSearchState.phase {
        case .empty:
            if tvSearchState.trimmedQuery.isEmpty {
               EmptyPlaceHolderView(text: "Search for TV Shows", image: Image(systemName: "magnifyingglass"))
            } else {
                ProgressView()
            }
        case .success(let values) where values.isEmpty:
            EmptyPlaceHolderView(text: "No TV Shows Found", image: Image(systemName: "exclamationmark.triangle"))
            
        case .failure(let error):
            ErrorView(error: error, retry: {
                Task {
                    await tvSearchState.search(query: tvSearchState.trimmedQuery)
                }
            })
            
        default: EmptyView()
        }
    }
    
    @ViewBuilder
    private func rowView(for tvShow: TVShow) -> some View {
        switch mode {
        case .review:
            NavigationLink(destination: ReviewFormView(showId: tvShow.id)) {
                TVShowRowView(tvShow: tvShow).padding(.vertical, 8)
            }
        case .watchlist:
            Button {
                onShowSelected?(tvShow)
                dismiss()
            } label: {
                HStack {
                    TVShowRowView(tvShow: tvShow).padding(.vertical, 8)
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

struct TVShowRowView: View {
    let tvShow: TVShow
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            TVShowPosterView(show: tvShow)
                .frame(width: 61, height: 92)
            VStack(alignment: .leading) {
                Text(tvShow.name)
                    .font(.headline)
                Text(tvShow.yearText)
                    .font(.subheadline)
            }
        }
        
    }
}
/*
#Preview {
    TVSearchView()
}
*/
