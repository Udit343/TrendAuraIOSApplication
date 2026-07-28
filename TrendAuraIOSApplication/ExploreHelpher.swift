//  ExploreHelpher.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 22/07/26.


import Foundation
import UIKit

struct HotItem{
    let title : String
}

struct StoreItem {
    let image : String
    let name : String
}

struct ProductItem {
    let productImage : String
    let profileImage : String
    let profileName : String
    let title : String
    let subTitle : String
    let visitCount : String
    let likeCount : String
}


enum ExploreSectionType {
    case hot
    case stores
    case cards
}


struct ExploreSection {
    
    let title : String
    
    let type : ExploreSectionType
    
    let hotItems : [HotItem]
    
    let storeItems : [StoreItem]
    
    let productItems : [ProductItem]
}


struct ExploreDummyData {

    static let sections: [ExploreSection] = [

        ExploreSection(

            title: "What's Hot",

            type: .hot,

            hotItems: [

                HotItem(title: "Alex Costa"),

                HotItem(title: "#mensfashion"),

                HotItem(title: "#Sneakers"),

                HotItem(title: "Cardigans"),

                HotItem(title: "#Nike"),

                HotItem(title: "#Winter")

            ],

            storeItems: [],

            productItems: []

        ),



        ExploreSection(

            title: "Popular Stores",

            type: .stores,

            hotItems: [],

            storeItems: [

                StoreItem(image: "nikeLogo", name: "Nike"),

                StoreItem(image: "tommyLogo", name: "Tommy"),

                StoreItem(image: "adidasLogo", name: "Adidas"),

                StoreItem(image: "underLogo", name: "Under"),

                StoreItem(image: "hmLogo", name: "H&M"),
                
                StoreItem(image: "nikeLogo", name: "Nike"),

                StoreItem(image: "tommyLogo", name: "Tommy"),

                StoreItem(image: "adidasLogo", name: "Adidas"),

                StoreItem(image: "underLogo", name: "Under"),

            ],

            productItems: []

        ),



        ExploreSection(

            title: "Trending this Week",

            type: .cards,

            hotItems: [],

            storeItems: [],

            productItems: [

                ProductItem(

                    productImage: "cardImage",

                    profileImage: "cardProfileImage",

                    profileName: "Chance Vaccaro",

                    title: "Women Shirts -",

                    subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

                    visitCount: "10.6k",

                    likeCount: "2.5k Likes"

                ),

                ProductItem(

                    productImage: "cardImage6",

                    profileImage: "cardProfileImage",

                    profileName: "Allison Workman",

                    title: "Regular Fit ",

                    subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

                    visitCount: "15.8k",

                    likeCount: "5.6k Likes"

                ),
                
                ProductItem(

                    productImage: "cardImage",

                    profileImage: "cardProfileImage",

                    profileName: "Chance Vaccaro",

                    title: "Regular Fit Textured ",

                    subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

                    visitCount: "10.6k",

                    likeCount: "2.5k Likes"

                ),
                
                ProductItem(

                    productImage: "cardImage6",

                    profileImage: "cardProfileImage",

                    profileName: "Allison Workman",

                    title: "Regular Fit Textured ",

                    subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

                    visitCount: "15k",

                    likeCount: "5k Likes"

                ),

            ]

        ),


        ExploreSection(

            title: "New and Noteworthy",

            type: .cards,

            hotItems: [],

            storeItems: [],

            productItems: [

                ProductItem(

                    productImage: "cardImage2",

                    profileImage: "cardProfileImage",

                    profileName: "Lincoln",

                    title: "Regular Fit Textured",

                    subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

                    visitCount: "12k",

                    likeCount: "3k Likes"

                ),

                ProductItem(

                    productImage: "cardImage3",

                    profileImage: "cardProfileImage",

                    profileName: "Skylar",

                    title: "Regular Fit Textured",

                    subTitle: "##fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

                    visitCount: "8k",

                    likeCount: "2k Likes"

                ),
                ProductItem(

                    productImage: "cardImage2",

                    profileImage: "cardProfileImage",

                    profileName: "Shivam tyagi",

                    title: "Regular Fit Textured ",

                    subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

                    visitCount: "12k",

                    likeCount: "3k Likes"

                ),
                
                ProductItem(

                    productImage: "cardImage3",

                    profileImage: "cardProfileImage",

                    profileName: "Skylar",

                    title: "Regular Fit Textured ",

                    subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instaliker",

                    visitCount: "8.8k",

                    likeCount: "2.6k Likes"

                ),

            ]

        ),



        ExploreSection(

            title: "Frequently Visited",

            type: .cards,

            hotItems: [],

            storeItems: [],

            productItems: [

                ProductItem(

                    productImage: "cardImage4",

                    profileImage: "cardProfileImage",

                    profileName: "Justin",

                    title: "Formal Shirt",

                    subTitle: "#formal",

                    visitCount: "20k",

                    likeCount: "7k"

                ),

                ProductItem(

                    productImage: "cardImage5",

                    profileImage: "cardProfileImage",

                    profileName: "Alexander",

                    title: "Denim Jacket",

                    subTitle: "#denim",

                    visitCount: "18k",

                    likeCount: "6k"

                ),
                ProductItem(

                    productImage: "cardImage4",

                    profileImage: "cardProfileImage",

                    profileName: "Justin",

                    title: "Formal Shirt",

                    subTitle: "#formal",

                    visitCount: "20k",

                    likeCount: "7k"

                ),
                
                ProductItem(

                    productImage: "cardImage5",

                    profileImage: "cardProfileImage",

                    profileName: "Regular Fit Textured resort shirt",

                    title: "Denim Jacket",

                    subTitle: "#denim",

                    visitCount: "18.8k",

                    likeCount: "6.9k Likes"

                ),

            ]

        )

    ]

}
