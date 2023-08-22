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
    
    public var title: String{
        character.name.uppercased()
    }
}
