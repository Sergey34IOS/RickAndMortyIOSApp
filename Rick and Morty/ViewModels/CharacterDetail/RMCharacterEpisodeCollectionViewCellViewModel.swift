//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  Rick and Morty
//
//  Created by My Air on 11.01.2023.
//

import Foundation

protocol RMEpisodeDataRender {
    var name: String { get }
    var episode: String { get }
    var air_date: String { get }
}


final class RMCharacterEpisodeCollectionViewCellViewModel {
    
    private let episodeDataUrl: URL?
    
    private var dataBlock: ((RMEpisodeDataRender) -> Void)?
    
    private var isFetching = false
    
    private var episode: RMEpisode? {
        didSet {
            guard let model = episode else {
                return
            }
            dataBlock?(model)
        }
    }
    
    // MARK: - Init
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
        
    }
    
    // MARK: - Public
    
    public func registerForData(_ block: @escaping (RMEpisodeDataRender) -> Void) {
        self.dataBlock = block
    }
    
    public func fetchEpisodes() {
        guard !isFetching else {
            if let model = episode {
                dataBlock?(model)
            }
                return
        }
        guard let url = episodeDataUrl,
              let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.episode = model
                }
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}
