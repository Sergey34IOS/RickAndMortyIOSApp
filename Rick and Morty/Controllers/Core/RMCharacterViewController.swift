//
//  RMCharacterViewControlle.swift
//  Rick and Morty
//
//  Created by My Air on 02.01.2023.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {
    
    private let characterListVIew = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpViews()
        extraRequest()
    }
    
    private func setUpViews()
    {
        view.addSubview(characterListVIew)
        NSLayoutConstraint.activate([
            characterListVIew.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListVIew.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListVIew.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListVIew.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
        
        
    func extraRequest() {RMService.shared.execute(.listCharacterRequests, expecting: RMGetAllCharactersResponse.self) { result in
        switch result {
        case .success(let model):
            print("Total: "+String(model.info.count))
            print("Page result count: "+String(model.results.count))
        case .failure(let error):
            print(String(describing: error))
        }
            }
        }
}
