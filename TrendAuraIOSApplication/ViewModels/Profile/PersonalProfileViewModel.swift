//  PersonalProfileViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 02/09/26.

import Foundation

final class PersonalProfileViewModel {
      
    var onLoadingChanged : ((Bool)->Void)?
    var onError : ((String)->Void)?
    var onProfileLoaded : ((UserProfile)->Void)?
    var onUpdateSuccess : (()->Void)?
    
    private(set) var isLoading = false {
        didSet{
            onLoadingChanged?(isLoading)
        }
    }
    
    private(set) var existingProfile: UserProfile?
    private(set) var existingProfilePicURL = ""
    
    func fatchExistingProfile() {
         isLoading = true
        
        Task{
            do{
                let response = try await ProfileService.shared.getProfile()
                self.existingProfilePicURL = response.data.profilePic
                self.existingProfile = response.data
                isLoading = false
                onProfileLoaded?(response.data)
            }catch{
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
    }
    
    
    func saveTapped(form validation : PersonalProfileValidation, newProfilepicURL : String?){
        
        isLoading = true
        
        func value(_ i: Int) -> String {
                    guard i < validation.links.count else { return "" }
                    return validation.links[i].trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        let additional = validation.AdditionalLink
                    .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                    .filter { !$0.isEmpty }
                    .map { AdditionalLink(link: $0) }
        
//        let links = validation.links
//            .map {$0.trimmingCharacters(in: .whitespacesAndNewlines)}
//            .filter { !$0.isEmpty }
//            .map { AdditionalLink(link: $0)}
        

        let request = UpdateProfileRequest(
                    name: validation.name,
                    userName: validation.username,
                    about: validation.about,
                    countryCode: existingProfile?.countryCode ?? "",
                    phoneNumber: existingProfile?.phoneNumber ?? "",
                    country: existingProfile?.country ?? "",
                    state: validation.state,
                    address: existingProfile?.address ?? "",
                    city: validation.city,
                    whatsappNumber: value(1),
                    contactEmail:   value(2),
                    facebookLink:   value(3),
                    youtubeLink:    value(6),
                    twitterLink:    value(5),
                    instagramLink:  value(7),
                    tikTokLink:     value(8),
                    linkedinLink:   value(9),
                    pinterestLink: existingProfile?.pinterestLink ?? "",
                    googleMap:      value(4),
                    profilePic: newProfilepicURL ?? existingProfilePicURL,
                    gender: validation.gender,
                    dob: validation.dob,
                    webLink:        value(0),
                    additionalLink: additional
                )

        
        
        Task {
            do{
                _ = try await ProfileService.shared.updateProfile(request)
                isLoading = false
                onUpdateSuccess?()
            }catch{
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
    }
}
