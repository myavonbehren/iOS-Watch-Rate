//
//  TVShowContentView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct TVShowContentView: View {
    let show: TVShow
    let showDescription: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TVShowBackdropView(show: show)
            VStack(alignment: .leading, spacing: 16){
                Text(show.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(show.yearText)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                if (showDescription) {
                    Text(show.overview)
                }
            }
            .padding(.horizontal)
        }
        Spacer()
    }
}

#Preview {
    TVShowContentView(show: TVShow.mockTVShow, showDescription: true)
}
