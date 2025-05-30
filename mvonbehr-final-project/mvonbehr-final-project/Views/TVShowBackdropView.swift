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
        AsyncImage(url: show.backdropURL) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "photo")
        }
    }
}

#Preview {
    TVShowBackdropView()
}
