//
//  Business.swift
//  Muncher
//
//  Created by Davy Chuon on 7/6/23.
//

import Foundation

struct YelpResponse: Codable {
    let businesses: [Business]
//    let total: Int
//    let region: Region
}

struct Business: Codable {
    let id: String
    let name: String
    let imageUrl: String
    let categories: [Category]
    let coordinates: Coordinates
    let location: Location
}

struct Category: Codable {
    let alias: String
    let title: String
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

struct Location: Codable {
    let address1: String
    let displayAddress: [String]
}

//struct Region: Codable {
//    let center: Center
//}

struct Center: Codable {
    let longitude: Double
    let latitude: Double
}
