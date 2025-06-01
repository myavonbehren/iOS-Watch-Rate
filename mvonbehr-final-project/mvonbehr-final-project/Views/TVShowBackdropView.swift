//
//  TVShowBackdropCard.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/30/25.
//

import SwiftUI

struct TVShowBackdropView: View {
    private var show: TVShow
    
    init(show: TVShow) {
        self.show = show
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                AsyncImage(url: show.backdropURL) { image in
                    image.resizable()
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
            .aspectRatio(16/9, contentMode: .fit)
        }
        
    }
}

#Preview {
    TVShowBackdropView(show: TVShow.mockTVShow)
}
