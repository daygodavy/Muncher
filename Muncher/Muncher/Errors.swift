//
//  Errors.swift
//  Muncher
//
//  Created by Davy Chuon on 7/13/23.
//

import Foundation

enum Errors: String, Error {
    case invalidSearch = "The requested search was invalid. Please try again."
    case invalidResponse = "Invalid response from server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
