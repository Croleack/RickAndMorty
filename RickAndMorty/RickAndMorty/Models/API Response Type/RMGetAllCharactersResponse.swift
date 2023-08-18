//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 18.08.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        //пейнджинг - api возвращает нам всего 20 результатов
        let next: String?
        let prev: String?
    }
    let info: Info
    //не что иное как RMCharacter
    let results: [RMCharacter]
}

