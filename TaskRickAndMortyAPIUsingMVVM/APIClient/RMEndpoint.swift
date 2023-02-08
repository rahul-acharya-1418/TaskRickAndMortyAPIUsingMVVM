//
//  RMEndpoint.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-20.
//

import Foundation

// MARK: - Unique API EndPoint
public enum RMEndpoint: String {
    // Endpoint to Get Character Info
    case character = "https://rickandmortyapi.com/api/character"
    // Endpoint to Get Location Info
    case location = "https://rickandmortyapi.com/api/location"
    // Endpoint to Get Episode Info
    case episode = "https://rickandmortyapi.com/api/episode"
}
