//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 18.08.2023.
//

import UIKit

final class CharacterListViewViewModel: NSObject {
    func fetchCharacters() {
        RMService.shared.execute(.listCaractersRequests,
                                 expecting: RMGetAllCharactersResponse.self) {result in
            switch result {
            case.success(let model):
                print("Total: "+String(model.info.pages))
                print("Page result count: "+String(model.results.count))
            case.failure(let error):
                print(String(describing: error))
            }
        }
    }
}
//чтобы модель соответствовала этим протоколам
extension CharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath)
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
}
