//
//  RMRequest.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-20.
//

import Foundation

/// Object that  represents a singlet API call
final class RMRequest {
    
    /// Desire Endpoint
    private let endpoint: RMEndpoint
    
    /// PathComponent for API if any,  
    private let pathComponent: [String]
    
    /// QueryParameter for API if any,
    private let queryParameter: [URLQueryItem]
    
    /// Constructed url for the api request in string formate
    public var urlString: String {
        var   string = endpoint.rawValue
        
        if !pathComponent.isEmpty {
            pathComponent.forEach{ string += "/\($0)"}
        }
        
        if !queryParameter.isEmpty {
            string += "?"
            let argumentString = queryParameter.compactMap {
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }.joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    /// Construct Request
    /// - Parameters:
    ///   - endpoint: Target EndPoint
    ///   - pathComponent: Collection of Path Components
    ///   - queryParameter: Collection of Query Parameters
    public init(endpoint: RMEndpoint, pathComponent: [String] = [], queryParameter: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponent = pathComponent
        self.queryParameter = queryParameter
    }
    
    
}
