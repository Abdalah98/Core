//
//  NetworkError.swift
//  TestFrameWorks
//
//  Created by Abdullah Omar on 28/08/2023.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case noData
    case serializationFailed
    case serverError(String)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .requestFailed:
            return "Request failed."
        case .noData:
            return "No data received."
        case .serializationFailed:
            return "Serialization failed."
        case .serverError(let message):
            return "Server error: \(message)"
        }
    }
}
