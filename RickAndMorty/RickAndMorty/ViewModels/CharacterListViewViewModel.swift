//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 18.08.2023.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate: AnyObject {
    //загрузка начальных символов
    func didLoadInitialCharacters()
    func didSelectCharacter(_ character: RMCharacter)
}


final class CharacterListViewViewModel: NSObject {
    
    public weak var delegate: RMCharacterListViewViewModelDelegate?
     
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(characterName: character.name, characterImageUrl: URL(string: character.image)
                )
                //теперь мы говорим модели просмотра ячеек
                cellViewModels.append(viewModel)
            }
           
        }
    }
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    
    
    
     
   public func fetchCharacters() {
       RMService.shared.execute(.listCaractersRequests,
                                expecting: RMGetAllCharactersResponse.self
                                //настройка утечки памяти есть
       ) { [weak self] result in
           switch result {
           case.success(let responseModel):
               let results = responseModel.results
               self?.characters = results
               DispatchQueue.main.async {
                   self?.delegate?.didLoadInitialCharacters()
               }
               
           case.failure(let error):
               print(String(describing: error))
           }
       }
   }
}
//чтобы модель соответствовала этим протоколам
extension CharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
       ) as? RMCharacterCollectionViewCell else {
            fatalError("неподерживаемая ячейка")
       }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    //благодаря этому протоколу UICollectionViewDelegateFlowLayout которая позволяет задавать размеры ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(
            //поскольку размеры устройств разные чтобы не пистаь здесь константу мы получим размер экрана нашего устройства
            width: width,
            height: width * 1.5
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        //мы хотим знать какой объект выбрал пользователь
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }
}
