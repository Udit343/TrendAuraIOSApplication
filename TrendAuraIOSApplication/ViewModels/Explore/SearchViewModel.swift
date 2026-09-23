//  SearchViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 07/09/26.

import Foundation

final class SearchViewModel {
    
    private(set) var users: [SearchUser] = []
    private(set) var promos: [ReelItem] = []
    private(set) var hashtags: [SearchHashtag] = []
    
    var onLoadingChanged: ((Bool) -> Void)?
    var onResultsUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    
    private(set) var isLoading = false {
        didSet { onLoadingChanged?(isLoading) }
    }
    
    //learn
    private var searchTask: Task<Void, Never>?
    
    func search(query: String, category: SearchCategory, page: Int = 1) {
        
        searchTask?.cancel()
        
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else{
            users = [];
            promos = [];
            hashtags = []
            onResultsUpdated?()
            return
        }
        
        isLoading = true
        
        searchTask = Task {
            
            try? await Task.sleep(nanoseconds: 400_000_000)
            guard  !Task.isCancelled else { return }
            
            do{
                switch category {
                case .users:
                    let response = try await ExploreService.shared.searchUsers(query: query, page: page)
                    guard !Task.isCancelled else { return }
                    
                    self.users = response.data
                    
                case .promos:
                    let response = try await ExploreService.shared.searchPromos(query: query, page: page)
                    
                    guard !Task.isCancelled else { return }
                    self.promos = response.data
                    
                case .hashtags:
                    let response = try await ExploreService.shared.searchHashtags(query: query, page: page)
                    
                    guard !Task.isCancelled else { return }
                    self.hashtags = response.data
                    
                case .all:
                    break;
                }
                
                self.isLoading = false
                self.onResultsUpdated?()
            }catch{
                guard !Task.isCancelled  else { return }
                self.isLoading = false
                self.onError?(error.localizedDescription)
            }
        }
    }
//    
//    func applyFilteredReels(_ reels: [ReelItem]) {
//            self.promos = reels
//    }
}

