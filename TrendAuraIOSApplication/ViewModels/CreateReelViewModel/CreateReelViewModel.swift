//  CreateReel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 18/09/26.

import Foundation
import UIKit

final class CreateReelViewModel{
      
    private(set) var categories : [ReelCategory] = []
    
    var onCategoriesLoded : (()->Void)?
    var onError :((String)->Void)?
    
    var onUploadProgress: ((String) -> Void)?
    var onUploadSuccess : (()->Void)?
    
    func fetchCategories(){
        Task {
            do{
                let response = try await CreateReel.shared.getCategory()
                self.categories = response.data
                self.onCategoriesLoded?()
            }catch{
                self.onError?(error.localizedDescription)
            }
        }
    }
    
    func submitReel(
        videoURL: URL,
        thumbnailImage: UIImage,
        title: String,
        description: String,
        visitLink: String,
        minPrice: String,
        maxPrice: String,
        duration: String,
        tags: [String],
        selectedCategories: [String],
        discount: String,
        couponId: String?,
        couponExpiryDate: String?
    ){
        
        Task{
            do{
                
                onUploadProgress?("Uploading thumbnail...")
                guard let thumbTempURL = saveThumbnailToTempFile(thumbnailImage) else {
                                    onError?("Could not prepare thumbnail.")
                                    return
                                }

                                onUploadProgress?("Creating reel...")
                
                let request = CreateReelRequest(
                                    mediaType: "V",
//                                    media: [videoURL.absoluteString],
                                    media: ["videos/2026/Feb/video_1770150049633.mp4"],
                                    audioUrl: "",
//                                    thumbnailUrl: thumbTempURL.absoluteString,
                                    thumbnailUrl:"images/2026/Feb/630EECCF-79F9-4980-9931-6F9C76B571DF.jpeg",
                                    title: title,
                                    discount: discount,
                                    description: description,
                                    visitLink: visitLink,
                                    minPrice: minPrice,
                                    maxPrice: maxPrice,
                                    duration: duration,
                                    tag: tags,
                                    category: selectedCategories,
                                    couponId: couponId,
                                    couponExpiryDate: couponExpiryDate
                                )
                
                let response = try await CreateReel.shared.createReel(request)
                               print(response.message)

                               onUploadSuccess?()

                           } catch {
                               onError?(error.localizedDescription)
                           }
        }
        
    }
    
    private func saveThumbnailToTempFile(_ image: UIImage) -> URL? {
            guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }

            let tempURL = FileManager.default
                .temporaryDirectory
                .appendingPathComponent(UUID().uuidString + ".jpg")

            do {
                try data.write(to: tempURL)
                return tempURL
            } catch {
                return nil
            }
        }
}
