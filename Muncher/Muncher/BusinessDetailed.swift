//
//  BusinessDetailed.swift
//  Muncher
//
//  Created by Davy Chuon on 7/13/23.
//

import Foundation

struct BusinessDetailed: Codable {
    let alias: String
    let categories: [Category]
    let coordinates: Coordinates
    let displayPhone: String
    let hours: [BusinessHours]
    let id: String
    let imageUrl: String
    let location: Location
    let name: String
    let url: String
}

struct BusinessHours: Codable {
    let hoursType: String
    let isOpenNow: Bool
    let open: [OpenHours]
}

struct OpenHours: Codable {
    let day: Int
    let end: String
    let isOvernight: Bool
    let start: String
}
