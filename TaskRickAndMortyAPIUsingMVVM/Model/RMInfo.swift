//
//  RMInfo.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-20.
//

import Foundation


struct RMInfo: Codable {
    
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
}
