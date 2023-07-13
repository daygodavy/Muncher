//
//  NetworkManager.swift
//  Muncher
//
//  Created by Davy Chuon on 7/6/23.
//
// swiftlint:disable all

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let apiKey = Keys.yelpAPIKey
    private let baseURL = "https://api.yelp.com/v3/businesses/"
    private let location = "location=San+Diego"
    private let limit = "limit=5"
    private var header: String!
//    let cache = NSCache()
    let decoder = JSONDecoder()
    
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        header = "Bearer \(apiKey)"
    }
    
    
    func getBusinesses(keyWord: String, location: String) async throws -> YelpResponse {
        
        let searchURL = "\(baseURL)search?term=\(keyWord)&location=\(location)&\(limit)"
        
        guard let url = URL(string: searchURL) else { throw Errors.invalidSearch }
        
        var request = URLRequest(url: url)
        request.setValue(header, forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw Errors.invalidResponse
        }
        
        do {
            return try decoder.decode(YelpResponse.self, from: data)
        } catch {
            throw Errors.invalidData
        }
    }
    
    func getBusiness(businessID: String) async throws -> BusinessDetailed {
        let searchURL = "\(baseURL)\(businessID)"
        guard let url = URL(string: searchURL) else { throw Errors.invalidSearch }
        
        var request = URLRequest(url: url)
        request.setValue(header, forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw Errors.invalidResponse
        }
        
        do {
            return try decoder.decode(BusinessDetailed.self, from: data)
        } catch {
            throw Errors.invalidData
        }
        
    }
}
