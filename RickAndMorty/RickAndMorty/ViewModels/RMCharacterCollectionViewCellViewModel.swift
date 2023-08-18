//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 18.08.2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
public let characterName: String
private let characterStatus: String
private let characterImageUrl: URL?
    
    // MARK: - Init
    
    init (
        characterName: String,
        characterStatus: String,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterImageUrl = characterImageUrl
        self.characterStatus = characterStatus
    }
    
    //
}
