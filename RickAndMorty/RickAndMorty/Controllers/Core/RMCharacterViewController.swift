//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 17.08.2023.
//

import UIKit

///контроллер персонажей для отображения 
final class RMCharacterViewController: UIViewController, CharacterListViewDelegate {
    func didLoadInitialCharacters() {
    }
    
    func didSelectCharacter(_ character: RMCharacter) {
    }
    
    //добавим представление персонажей
    private let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //.systemBackground - означает, что система будет поддерживать цвет зависимоти от режима(белый при дневном режиме)
        //backgroundColor
        view.backgroundColor = .systemBackground
        
        title = "Characters"
        setUpView()
    }
        private func setUpView() {
            characterListView.delegate = self
            view.addSubview(characterListView)
            //настроим некоторые ограничения
            NSLayoutConstraint.activate([
                //закрепляем его сверху
                characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
        }
    func rmCharacterListView(_ characterListView: CharacterListView, didSelectCharacter character: RMCharacter){
        print("Selected character: \(character.name)")
        //открыть контроллер деталей
        let viewModel = RMCharacterDetalViewViewModel(character: character)
        let detalVC = RMCharacterDetalViewController(viewModel: viewModel)
        navigationController?.pushViewController(detalVC, animated: true)
        
    }
}
