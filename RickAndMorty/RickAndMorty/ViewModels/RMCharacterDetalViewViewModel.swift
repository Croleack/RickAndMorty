//
//  RMCharacterDetalViewViewModel.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 21.08.2023.
//

import Foundation

final class RMCharacterDetalViewViewModel {
    private let character: RMCharacter
    
    //мы должны передать правильное название персонажа
    init (character: RMCharacter) {
        self.character = character
    }
    
    public var title: String{
        character.name.uppercased()
    }
}
