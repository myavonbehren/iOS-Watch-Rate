//
//  TVShowDetailState.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import Foundation

class TVShowDetailState: ObservableObject {
    private let tvShowService: TVShowService
    @Published var tvShow: TVShow?
    @Published var isLoading: Bool = false
    @Published var error: NSError?
    
    init(tvShowService: TVShowService = TVShowStore.shared) {
        self.tvShowService = tvShowService
    }
    
    func loadTVShow(id: Int) async {
        if Task.isCancelled { return }
        
        await MainActor.run {
            isLoading = true
            error = nil
            tvShow = nil
        }
        
        do {
            let show = try await tvShowService.fetchTVShow(id: id)
            await MainActor.run {
                tvShow = show
                isLoading = false
            }
        } catch {
            await MainActor.run {
                self.error = error as NSError
                self.isLoading = false
            }
        }
        
    }
}
