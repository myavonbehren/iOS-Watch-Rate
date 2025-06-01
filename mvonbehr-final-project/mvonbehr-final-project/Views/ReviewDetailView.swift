//
//  ReviewDetailView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//
 
import SwiftUI

struct ReviewDetailView: View {
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
                    TVShowContentView(show: show, showDescription: false)
                    VStack (alignment: .leading) {
                        Text("Star rating")
                        Text("Liked")
                        Text("Review text")
                    }.padding(.horizontal)
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
    ReviewDetailView(showId: TVShow.mockTVShow.id)
}
