//
//  WatchListDetailView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct WatchListDetailView: View {
    let showId: Int
    @ObservedObject private var tvShowDetailState = TVShowDetailState()
    
    var body: some View {
        ZStack {
            if tvShowDetailState.isLoading {
                LoadingView()
            } else if let error = tvShowDetailState.error {
                ErrorView(error: error) {
                    await loadShow()
                }
            } else if let show = tvShowDetailState.tvShow {
                VStack (alignment: .leading, spacing: 10) {
                    TVShowContentView(show: show, showDescription: true)
                }
            }
        }
        .task {
            await loadShow()
        }
        Spacer()
    }
    
    private func loadShow() async {
        await tvShowDetailState.loadTVShow(id: showId)
    }
}

#Preview {
    WatchListDetailView(showId: TVShow.mockTVShow.id)
}
