//
//  TVShowSearchState.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI
import Combine
import Foundation

class TVShowSearchState: ObservableObject {
    @Published var query = ""
    @Published private(set) var phase: DataFetchPhase<[TVShow]> = .empty
    
    private var cancellables = Set<AnyCancellable>()
    private let tvShowService: TVShowService
    
    private var trimmedQuery: String {
        query.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var tvShows: [TVShow] {
        phase.value ?? []
    }
    
    init(tvShowService: TVShowService = TVShowStore.shared) {
        self.tvShowService = tvShowService
    }
    
    func startObserve() {
    }
    
}
