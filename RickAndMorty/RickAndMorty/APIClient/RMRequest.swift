//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 17.08.2023.
//

import Foundation
///объект, который представляет один вызов API 
final class RMRequest {
    
    //любой наш запрос содержит всю необходимую информацию
    //базовый URL
    //конечные точки Edpoint
    //компонент пути
    ///Константы API
    private struct Constans {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }

    private var endpoint = RMEndpoint.character
    //позволит добавлять компонент в конце пути 
    private let pathComponents: [String]
    //аргументы запроса для api если такие есть
    private let queryParamers: [URLQueryItem]
    //сконстуированный URL адрес запроса api в строковой форме
    private var urlString: String {
        //получаем базовый URL
        var string = Constans.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents .isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParamers .isEmpty {
            string += "?"
            
            let argumentString = queryParamers.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
           
            string += argumentString
        }
        
        return string
    }
    
    //вычисляемое свойство и созданный URL адрес API
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    init(
       endpoint: RMEndpoint,
        //они могут быть пустыми
        pathComponents: [String] = [],
        queryParamers: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParamers = queryParamers
        
    }
    
    //https://rickandmortyapi.com/api/character/2
}


extension RMRequest {
    static let listCaractersRequests = RMRequest(endpoint: .character)
}
