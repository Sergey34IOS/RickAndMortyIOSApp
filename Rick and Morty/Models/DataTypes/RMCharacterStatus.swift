//
//  RMCharacterStatus.swift
//  Rick and Morty
//
//  Created by My Air on 02.01.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    // "Alive", "Dead" or "Unknown"
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
