//
//  NetworkError.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case unAuthuroziedError
    
    var localizedStrings :String{
        switch self{
            case .invalidURL:
            return NetworkErrorStrings.InvalidURL.localized
            
            case .requestFailed(let underlyingError):
            return " \(NetworkErrorStrings.RequestFailed.localized + underlyingError.localizedDescription)"
            
            case .invalidResponse:
            return NetworkErrorStrings.InvalidResponse.localized
            
            case .decodingFailed(let underlyingError):
            return "\(NetworkErrorStrings.DecodingFailedWithError.localized + underlyingError.localizedDescription)"
            
        case .unAuthuroziedError:
            return NetworkErrorStrings.UnAuthorizedError.localized
            
        }
    }
    
}
