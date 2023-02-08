//
//  Enums.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-23.
//

import Foundation
import UIKit


// MARK: - HTTP Request MeThods for use Generic API Call
public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


// MARK: - Character Status with define color code in (RMCharacterVC)
public enum RMStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var statusColor: UIColor {
        switch self {
            
        case .alive:
            return .green
        case .dead:
            return .red
        case .unknown:
            return .gray
        }
    }
}


// MARK: - Third Party(Lottie-ios) image set in Right Side Navigation Bar
public enum LottieStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var changeName: String {
        switch self {
        case .alive:
            return "alive"
        case .dead:
            return "dead"
        case .unknown:
            return "unknown"
        }
    }
}


// MARK: - Closure Events use in (Character View Model)
public enum Event {
    
    case valid
    case dataPass
    case error(Error?)
}


// MARK: - Title Name Color Change in  CharacterDetails Screen
enum RMCharacterDetailsTitleColor: String {
    
    case status = "STATUS"
    case gender = "GENDER"
    case location = "LOCATION"
    case species = "SPECIES"
    case origin = "ORIGIN"
    case type = "TYPE"
    case created = "CREATED"
    case episode = "TOTAL EPISODE"
    
    var tintColor: UIColor {
        switch self {
        case .status:
            return .systemBlue
        case .gender:
            return .systemRed
        case .location:
            return .systemYellow
        case .species:
            return .systemGreen
        case .origin:
            return .systemOrange
        case .type:
            return .systemPurple
        case .created:
            return .systemPink
        case .episode:
            return .systemMint
        }
    }
}
