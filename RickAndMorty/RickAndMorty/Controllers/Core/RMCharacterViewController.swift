//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 17.08.2023.
//

import UIKit

final class RMCharacterViewController: UIViewController, CharacterListViewDelegate {
    func didLoadInitialCharacters() {
    }
    
    func didSelectCharacter(_ character: RMCharacter) {
    }
    
    private let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .systemBackground
        
        title = "Characters"
        setUpView()
    }
        private func setUpView() {
            characterListView.delegate = self
            view.addSubview(characterListView)
            
            NSLayoutConstraint.activate([
                //fix it on top
                characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ]
            )
        }
    func rmCharacterListView(_ characterListView: CharacterListView, didSelectCharacter character: RMCharacter){
        print("Selected character: \(character.name)")
        //open controller details
        let viewModel = RMCharacterDetalViewViewModel(character: character)
        let detalVC = RMCharacterDetalViewController(viewModel: viewModel)
        navigationController?.pushViewController(detalVC, animated: true)
        
    }
}
