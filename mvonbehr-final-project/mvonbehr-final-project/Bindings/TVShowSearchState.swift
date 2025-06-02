//
//  TVShowSearchState.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI
import Combine
import Foundation

@MainActor
class TVShowSearchState: ObservableObject {
    @Published var query = ""
    @Published private(set) var phase: DataFetchPhase<[TVShow]> = .empty
    private var searchTask: Task<Void, Never>?
    
    private var cancellables = Set<AnyCancellable>()
    private let tvShowService: TVShowService
    
    var trimmedQuery: String {
        query.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var tvShows: [TVShow] {
        phase.value ?? []
    }
    
    init(tvShowService: TVShowService = TVShowStore.shared) {
        self.tvShowService = tvShowService
    }
    
    func startObserve() {
        guard cancellables.isEmpty else {return}
        
        $query
            .filter { $0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .sink { [weak self] _ in
                self?.searchTask?.cancel()
                self?.phase = .empty
            }
            .store(in: &cancellables)

        $query
            .filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .debounce(for: 1, scheduler: DispatchQueue.main)
            .sink { [weak self] query in
                self?.searchTask?.cancel()
                self?.searchTask = Task {
                    await self?.search(query: query)
                }
            }
            .store(in: &cancellables)
    }
    
    func search(query: String) async {
        if Task.isCancelled { return }
        phase = .empty
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedQuery.isEmpty else {
            return
        }
                
        do {
            let tvShows = try await tvShowService.searchTVShow(query: trimmedQuery)
            if Task.isCancelled { return }
            guard trimmedQuery == self.trimmedQuery else { return }
            phase = .success(tvShows)
        } catch {
            if Task.isCancelled { return }
            guard trimmedQuery == self.trimmedQuery else { return }
            phase = .failure(error)
        }
    }
    
}
