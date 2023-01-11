//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  Rick and Morty
//
//  Created by My Air on 11.01.2023.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    
    public let value: String
    public let title: String
    
    init(value: String, title: String) {
        self.value = value
        self.title = title
    }
}
