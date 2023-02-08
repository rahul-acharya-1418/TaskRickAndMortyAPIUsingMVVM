//
//  RMResults.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-20.
//

import Foundation
import UIKit


struct RMResults: Codable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: RMGeneral
    let location: RMGeneral
    let episode: [String]
    let url: String
    let image: String
    let created: String
    
}
