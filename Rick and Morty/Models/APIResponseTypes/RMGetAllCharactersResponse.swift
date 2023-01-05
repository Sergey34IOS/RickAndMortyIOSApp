//
//  GetAllCharactersResponse.swift
//  Rick and Morty
//
//  Created by My Air on 04.01.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let pref: String?
    }
    let info: Info
    let results: [RMCharacter]
}
