//  SignUpHelpher.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 21/07/26.

import Foundation


enum FieldType {
    case name
    case email
    case password
    case confirmPassword
}

struct InputModel {
    let title: String
    let placeholder: String
    let secure: Bool
    let fieldType: FieldType
}

let SignUpData = [

    InputModel(
        title: "Enter Name",
        placeholder: "Enter Name",
        secure: false,
        fieldType: .name
    ),

    InputModel(
        title: "Enter Email",
        placeholder: "Enter Email",
        secure: false,
        fieldType: .email
    ),

    InputModel(
        title: "Password",
        placeholder: "Password",
        secure: true,
        fieldType: .password
    ),

    InputModel(
        title: "Confirm Password",
        placeholder: "Confirm Password",
        secure: true,
        fieldType: .confirmPassword
    )
]


