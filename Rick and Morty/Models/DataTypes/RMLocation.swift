//
//
//  RMLocation.swift
//  Rick and Morty
//
//  Created by My Air on 02.01.2023.
//

import Foundation

struct RMLocationSchema: Codable {
    
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}


