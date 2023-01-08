//
//  RMCharacterViewControlle.swift
//  Rick and Morty
//
//  Created by My Air on 02.01.2023.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController, RMCharacterListViewDelegate {
    
    private let characterListVIew = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpViews()
    }
    
    private func setUpViews() {
        characterListVIew.delegate = self
        view.addSubview(characterListVIew)
        NSLayoutConstraint.activate([
            characterListVIew.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListVIew.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListVIew.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListVIew.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
        
        // MARK: - RMCharacterListViewDelegate
    
    func rmCharacterListView(_characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        // Open detail controller for that character
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
