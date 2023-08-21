//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 18.08.2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
public let characterName: String
private let characterImageUrl: URL?
    
    // MARK: - Init
    
    init (
        characterName: String,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterImageUrl = characterImageUrl
    }
    
    //функция извлечения содержимого изображения
    public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void) {
        //TODO: Abstract to Image Manager 
        guard let url = characterImageUrl else {
            //ошибка неверного url адреса
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request)
        {data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
