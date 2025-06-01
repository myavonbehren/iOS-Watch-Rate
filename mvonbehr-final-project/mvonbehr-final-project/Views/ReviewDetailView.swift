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
            
        }
    }
}

#Preview {
    ReviewDetailView(showId: TVShow.mockTVShow.id )
}
