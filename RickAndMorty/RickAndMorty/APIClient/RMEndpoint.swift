//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 18.08.2023.
//

import Foundation
///представление уникальных конечных точек API
//переяисления @frozan - гугли что это 
@frozen enum RMEndpoint: String {
    ///конечная точка для получении информации о персонаже
    case character
    ///конечная точка для получении информации о локации
    case location
    ///конечная точка для получении информации о эпизоде
    case episode
    
}
