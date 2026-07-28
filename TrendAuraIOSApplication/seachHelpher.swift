//  seachHelpher.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 23/07/26.


import Foundation

let CategoryName = [
    "All",
    "Users",
    "Promos",
    "Hashtags"
]

struct userModel {
    let userImage : String
    let userName : String
    let userSubName : String
}


let  usersData : [userModel] = [
     userModel(userImage: "user1", userName: "Jaxson Dorwart", userSubName: "@jakthomas"),
     userModel(userImage: "user2", userName: "Corey Workman", userSubName: "@jakthomas"),
     userModel(userImage: "user3", userName: "Rayna Bator", userSubName: "@jakthomas"),
     userModel(userImage: "user4", userName: "Marilyn Dorwart", userSubName: "@jakthomas"),
     userModel(userImage: "user5", userName: "Aspen Gouse", userSubName: "@jakthomas"),
     userModel(userImage: "user6", userName: "Maria Carder", userSubName: "@jakthomas"),
     
     userModel(userImage: "user1", userName: "Jaxson Dorwart", userSubName: "@jakthomas"),
     userModel(userImage: "user2", userName: "Corey Workman", userSubName: "@jakthomas"),
     userModel(userImage: "user3", userName: "Rayna Bator", userSubName: "@jakthomas"),
     userModel(userImage: "user4", userName: "Marilyn Dorwart", userSubName: "@jakthomas"),
     userModel(userImage: "user5", userName: "Aspen Gouse", userSubName: "@jakthomas"),
     userModel(userImage: "user6", userName: "Maria Carder", userSubName: "@jakthomas"),
     
     userModel(userImage: "user1", userName: "Jaxson Dorwart", userSubName: "@jakthomas"),
     userModel(userImage: "user2", userName: "Corey Workman", userSubName: "@jakthomas"),
     userModel(userImage: "user3", userName: "Rayna Bator", userSubName: "@jakthomas"),
     userModel(userImage: "user4", userName: "Marilyn Dorwart", userSubName: "@jakthomas"),
     userModel(userImage: "user5", userName: "Aspen Gouse", userSubName: "@jakthomas"),
     userModel(userImage: "user6", userName: "Maria Carder", userSubName: "@jakthomas"),
]


struct HashTagModel {
    let hashNmae : String
    let promos : String
}

let hashTagData : [HashTagModel] = [
    HashTagModel(hashNmae: "#shirt", promos: "225 Promos"),
    HashTagModel(hashNmae: "#shirtdesign", promos: "1.5k Promos"),
    HashTagModel(hashNmae: "#shirts", promos: "54.2k Promos"),
    HashTagModel(hashNmae: "#shirtdress", promos: "10 Promos"),
    HashTagModel(hashNmae: "#shirtcasual ", promos: "30.6k Promos"),
    HashTagModel(hashNmae: "#shirt", promos: "225 Promos"),
    HashTagModel(hashNmae: "#shirtdesign", promos: "1.5k Promos"),
    HashTagModel(hashNmae: "#shirts", promos: "54.2k Promos"),
    HashTagModel(hashNmae: "#shirtdress", promos: "10 Promos"),
    HashTagModel(hashNmae: "#shirtcasual ", promos: "30.6k Promos"),
    HashTagModel(hashNmae: "#shirt", promos: "225 Promos"),
    HashTagModel(hashNmae: "#shirtdesign", promos: "1.5k Promos"),
    HashTagModel(hashNmae: "#shirts", promos: "54.2k Promos"),
    HashTagModel(hashNmae: "#shirtdress", promos: "10 Promos"),
    HashTagModel(hashNmae: "#shirtcasual ", promos: "30.6k Promos"),
    HashTagModel(hashNmae: "#shirt", promos: "225 Promos"),
    HashTagModel(hashNmae: "#shirtdesign", promos: "1.5k Promos"),
    HashTagModel(hashNmae: "#shirts", promos: "54.2k Promos"),
    HashTagModel(hashNmae: "#shirtdress", promos: "10 Promos"),
    HashTagModel(hashNmae: "#shirtcasual ", promos: "30.6k Promos"),
    HashTagModel(hashNmae: "#shirt", promos: "225 Promos"),
    HashTagModel(hashNmae: "#shirtdesign", promos: "1.5k Promos"),
    HashTagModel(hashNmae: "#shirts", promos: "54.2k Promos"),
    HashTagModel(hashNmae: "#shirtdress", promos: "10 Promos"),
    HashTagModel(hashNmae: "#shirtcasual ", promos: "30.6k Promos"),
]




struct CardItem {
    let productImage : String
    let profileImage : String
    let profileName : String
    let title : String
    let subTitle : String
    let visitCount : String
    let likeCount : String
}

let cardItems :  [CardItem] = [
    CardItem(

        productImage: "cardImage",

        profileImage: "cardProfileImage",

        profileName: "Chance Vaccaro",

        title: "Women Shirts ",

        subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

        visitCount: "10.6k",

        likeCount: "2.5k Likes"

    ),

    CardItem(

        productImage: "cardImage6",

        profileImage: "cardProfileImage",

        profileName: "Allison Workman",

        title: "Regular Fit ",

        subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

        visitCount: "15.8k",

        likeCount: "5.6k Likes"

    ),
    
    CardItem(

        productImage: "cardImage",

        profileImage: "cardProfileImage",

        profileName: "Chance Vaccaro",

        title: "Regular Fit ",

        subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

        visitCount: "10.6k",

        likeCount: "2.5k Likes"

    ),
    
    CardItem(

        productImage: "cardImage6",

        profileImage: "cardProfileImage",

        profileName: "Allison Workman",

        title: "Regular Fit ",

        subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

        visitCount: "15k",

        likeCount: "5k Likes"

    ),
    CardItem(

        productImage: "cardImage6",

        profileImage: "cardProfileImage",

        profileName: "Allison Workman",

        title: "Regular Fit ",

        subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

        visitCount: "15.8k",

        likeCount: "5.6k Likes"

    ),
    
    CardItem(

        productImage: "cardImage",

        profileImage: "cardProfileImage",

        profileName: "Chance Vaccaro",

        title: "Regular Fit ",

        subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

        visitCount: "10.6k",

        likeCount: "2.5k Likes"

    ),
    
    CardItem(

        productImage: "cardImage6",

        profileImage: "cardProfileImage",

        profileName: "Allison Workman",

        title: "Regular Fit ",

        subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

        visitCount: "15k",

        likeCount: "5k Likes"

    ),
    CardItem(

        productImage: "cardImage6",

        profileImage: "cardProfileImage",

        profileName: "Allison Workman",

        title: "Regular Fit ",

        subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

        visitCount: "15.8k",

        likeCount: "5.6k Likes"

    ),
    
    CardItem(

        productImage: "cardImage",

        profileImage: "cardProfileImage",

        profileName: "Chance Vaccaro",

        title: "Regular Fit ",

        subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

        visitCount: "10.6k",

        likeCount: "2.5k Likes"

    ),
    
    CardItem(

        productImage: "cardImage6",

        profileImage: "cardProfileImage",

        profileName: "Allison Workman",

        title: "Regular Fit ",

        subTitle: "#fashion #style #love #instagood #photography #like #beautiful #photooftheday #instagram #model #follow #ootd #fashionstyle #beauty #art #fashionblogger #picoftheday #moda #fashionista #instadaily #bhfyp #happy #instafashion #cute #likeforlikes #followme #shopping #smile #makeup #instalike",

        visitCount: "15k",

        likeCount: "5k Likes"

    ),
]



enum SearchCategory {
     case all
     case users
    case   promos
    case hashtags
}



