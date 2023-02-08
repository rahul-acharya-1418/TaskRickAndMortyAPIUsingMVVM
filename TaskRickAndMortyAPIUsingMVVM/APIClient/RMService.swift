//
//  RMService.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-20.
//

import Foundation

public typealias HTTPHeaders = [String: String]

/// Primary API Service Object to get Rick and Morty data
final class RMService {
    
    /// Shared Singleton instance
    static let shared = RMService()
    
    /// privatised constructor
    private init() {}
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Call back with data or error
    public func execute<T: Codable>(
        _ request: String,
        method: RequestMethod,
        headers: HTTPHeaders? = nil,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
            
            guard let url = URL(string: request) else { return }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
            urlRequest.allHTTPHeaderFields = headers
            URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(type.self, from: data)
                    completion(.success(results))
                }
                catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    
    
}
