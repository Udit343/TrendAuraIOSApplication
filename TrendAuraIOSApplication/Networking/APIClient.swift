//  APIClient.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 25/08/26.

import Foundation

final class APIClient {
    
    static let shared  = APIClient()
    private init() {}
    
    
    
    func post<Body: Encodable, Response: Decodable>(
        _ endpoint : APIENDpoint,
        body : Body,
        responseType : Response.Type,
        requiresAuth : Bool = false
    )async throws -> Response {
        
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if requiresAuth {
            if let token = KeychainHelpher.shared.getToken(){
                request.setValue(token, forHTTPHeaderField: "Authorization")
            }
        }
        
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let raw = String(data: data, encoding: .utf8){
            
            print(" RAW RESPONSE:", raw)
        }
        
        print(request.allHTTPHeaderFields ?? [:])
        
        print("STATUS CODE:", (response as? HTTPURLResponse)?.statusCode ?? -1)
        
        if let bodyData = request.httpBody, let bodyString = String(data: bodyData, encoding: .utf8) {
            print(" REQUEST BODY:", bodyString)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknown
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            do{
                return try JSONDecoder().decode(Response.self, from: data)
            }catch{
                print("DECODE ERROR:", error)
                throw APIError.decodingFailed
            }
            
        default:
            if let errorBody = try? JSONDecoder().decode(APIErrorResponse.self, from: data){
                throw APIError.server(message: errorBody.message)
            }
            throw APIError.unknown
        }
    }
    
    
    
    
    
    func get<Response : Decodable>(
        _ endPoint : APIENDpoint,
        reponseType : Response.Type,
        requiresAuth : Bool = true
    ) async throws -> Response{
        var request = URLRequest(url: endPoint.url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if requiresAuth {
            if let token = KeychainHelpher.shared.getToken(){
                request.setValue(token, forHTTPHeaderField: "Authorization")
            }
        }
        
        let (data, response ) = try await URLSession.shared.data(for: request)
        
              if let raw = String(data: data, encoding: .utf8) {
                    print(" RAW RESPONSE:", raw)
                }
        
                print(request.allHTTPHeaderFields ?? [:])
        
                print("STATUS CODE:", (response as? HTTPURLResponse)?.statusCode ?? -1)
        
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknown
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            do{
                return try JSONDecoder().decode(Response.self, from: data)
            }catch{
                print("DECODE ERROR:", error)
                 throw APIError.decodingFailed
            }
            
        default:
            if let errorBody = try?
                JSONDecoder().decode(APIErrorResponse.self, from: data){
                throw APIError.server(message: errorBody.message)
            }
            
            throw APIError.unknown
        }
    }
    
    
    
}
