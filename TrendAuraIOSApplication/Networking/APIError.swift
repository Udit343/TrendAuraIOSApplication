
//  APIError.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 24/08/26.

import Foundation

enum APIError : Error, LocalizedError{
     case invalidURL
     case decodingFailed
     case server(message: String)
     case unknown
    
    var errorDescription : String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .decodingFailed: return "somethings went wrong parsing the response"
            
        case .server(let message): return message
        case .unknown: return "Something went wrong please try again"
        }
    }
}



