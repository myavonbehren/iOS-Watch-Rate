//
//  TVShowPosterView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct TVShowPosterView: View {
    private var show: TVShow
    
    init(show: TVShow) {
        self.show = show
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: show.posterURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
            } placeholder: {
                    Rectangle()
                        .fill(Color.black.opacity(0.5))
                        .overlay(
                            VStack {
                                Image(systemName: "photo")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                Text(show.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                        )
                        .cornerRadius(8)
            }
        }
        .frame(width: 204, height: 306)
    }
}

#Preview {
    TVShowPosterView(show: TVShow.mockTVShow)
}
