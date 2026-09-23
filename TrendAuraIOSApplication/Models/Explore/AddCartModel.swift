//  AddCartModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 08/09/26.

struct  AddToCartRequest : Encodable{
    let reel_id : String
}

struct AddToCartResponse : Decodable {
    let message : String
}
