//
//  CharacterAPIError.swift
//  Networking
//
//  Created by Ron Lane on 4/22/24.
//

import Foundation

enum CharacterAPIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData                       : return "Invalid data"
        case .jsonParsingFailure                : return "JSON parsing failure"
        case let .requestFailed(description)    : return "Request failed \(description)"
        case let .invalidStatusCode(statusCode) : return "Invalid status code \(statusCode)"
        case let .unknownError(error)           : return "An unknown error occured \(error.localizedDescription)"
        }
    }
}
