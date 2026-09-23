//  ExploreViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 03/09/26.

import Foundation

final class ExploreViewModel {
    private(set) var sections : [ExploreSections] = []
    
    var onLoadingChanged : ((Bool)->Void)?
    var onDataLoaded : (()->Void)?
    var onError : ((String)->Void)?
    
    private(set) var isLoading = false {
        didSet{
            onLoadingChanged?(isLoading)
        }
    }
    
    
    func fetchExplore(){
         isLoading = true
        
        Task{
            do{
                let response = try await ExploreService.shared.getExploreData()
                buildSections(from: response)
                isLoading = false
                onDataLoaded?()
            }catch{
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
        
    }
    
    private func buildSections(from response : ExploreResponse){
        var built : [ExploreSections] = []
        
        if !response.topTags.isEmpty {
            built.append(ExploreSections(type: .tags(
                title: "Top tag",
                items: response.topTags.map { $0.toHotItem()}
            )))
        }
        
        
        if !response.popularStore.isEmpty {
            built.append(ExploreSections(type: .stores(
                title: "Popular Store",
                items: response.popularStore.map { $0.toStoreItem()}
            )))
        }
        
        if !response.frequentlyVisited.isEmpty {
                    built.append(ExploreSections(type: .reels(
                        title: "Frequently Visited",
                        items: response.frequentlyVisited.map { $0.toProductItem() }
                    )))
                }

                if !response.newAndNoteworthy.isEmpty {
                    built.append(ExploreSections(type: .reels(
                        title: "New & Noteworthy",
                        items: response.newAndNoteworthy.map { $0.toProductItem() }
                    )))
                }

                if !response.trendingThisWeek.isEmpty {
                    built.append(ExploreSections(type: .reels(
                        title: "Trending This Week",
                        items: response.trendingThisWeek.map { $0.toProductItem() }
                    )))
                }

                self.sections = built

    }
    
//    func applyFilteredReels(_ reels: [ReelItem]) {
//            let filteredSection = ExploreSections(type: .reels(
//                title: "Filtered Results",
//                items: reels.map { $0.toProductItem() }
//            ))
//            self.sections = [filteredSection]
//        }
}
