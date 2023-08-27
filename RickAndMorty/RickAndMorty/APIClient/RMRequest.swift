//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 17.08.2023.
//

import Foundation
///an object that represents a single API call
final class RMRequest {
    
    ///Константы API
    private struct Constans {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    //chat gpt
        func generateURL() -> URL? {
        var urlComponents = URLComponents(string: Constans.baseUrl)
        urlComponents?.path = "/" + endpoint.rawValue
        urlComponents?.queryItems = queryParamers

        return urlComponents?.url
    }
    
    private var endpoint = RMEndpoint.character
    //will add a component at the end of the path
    private let pathComponents: [String]
    //request arguments for api if any
    private let queryParamers: [URLQueryItem]
    //constructed api request url in string form
    private var urlString: String {
        //get base url
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
    
    //computed property and generated API URL
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    init(
       endpoint: RMEndpoint,
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

