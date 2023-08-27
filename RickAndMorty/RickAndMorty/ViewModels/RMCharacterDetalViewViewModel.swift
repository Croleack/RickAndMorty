//
//  RMCharacterDetalViewViewModel.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 21.08.2023.
//

import Foundation

final class RMCharacterDetalViewViewModel {
    private let character: RMCharacter
    
    init (character: RMCharacter) {
        self.character = character
    }
    
    private var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    
    public var title: String{
        character.name.uppercased()
    }
    
    public func fetchCharacterData() {
        let request = RMRequest(endpoint: .character)
        if let url = request.generateURL() {
            // Теперь у вас есть корректно сформированный URL для запроса
            print(url)
            // Здесь вы можете выполнять сетевые запросы с использованием полученного URL
     
            }
        print(request.url)
        }
       
    }
    
