//  FilterViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 08/09/26.

import Foundation
import UIKit

final class FilterViewModel {
    
    private(set) var checkedItems: Set<IndexPath> = []

        var onFilterApplied: (([ReelItem]) -> Void)?
        var onError: ((String) -> Void)?
        var onLoadingChanged: ((Bool) -> Void)?

        private(set) var isLoading = false {
            didSet { onLoadingChanged?(isLoading) }
        }

        func isChecked(at indexPath: IndexPath) -> Bool {
            checkedItems.contains(indexPath)
        }
    
       func toggle(at indexPath: IndexPath) {
            if checkedItems.contains(indexPath) {
                checkedItems.remove(indexPath)
            } else {
                checkedItems.insert(indexPath)
            }
        }

        func resetAll() {
            checkedItems.removeAll()
        }
    
    private func buildRequest() -> FilterRequest {
        var request = FilterRequest()
        
        for indexPath in checkedItems {
            let section = allFilterSections[indexPath.section]
            guard indexPath.row > 0, indexPath.row - 1 < section.items.count else { continue }
            let label = section.items[indexPath.row - 1]
            
            switch label {
            case "Most Liked": request.mostLike = true
            case "Most Shared": request.mostShare = true
            case "Most Visited": request.mostVisit = true
            case "Most Added to Cart": request.mostAddToCart = true
            case "Any Time": request.anyTime = true
            case "Today": request.today = true
            case "This Week": request.thisWeek = true
            case "This Month": request.thisMonth = true
            case "Any Duration": request.anyDuration = true
            case "Under 30 seconds": request.under30Seconds = true
            case "Under 60 seconds": request.under60Seconds = true
            case "Over 60 seconds": request.over60Seconds = true
            case "Discount": request.discount = true
            default: break
            }
        }
        
        return request
    }
    
    func applyTapped() {
            isLoading = true
            let request = buildRequest()

            Task {
                do {
                    let response = try await ExploreService.shared.filterReels(request)
                    isLoading = false
                    onFilterApplied?(response.data)
                } catch {
                    isLoading = false
                    onError?(error.localizedDescription)
                }
            }
        }
}

