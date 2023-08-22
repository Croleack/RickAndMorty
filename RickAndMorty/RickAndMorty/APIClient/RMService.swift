//
//  RMService.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 17.08.2023.
//

import Foundation
///The main API service object for getting data (get)
final class RMService {
    ///common instance
    static let shared = RMService()
    
    private init() {}
    
    enum RMServiceError: Error {
    
        case failedToCreateRequest
        case failedToGetData
        
    }
    
    //we will create a request and receive some Void data
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
                        completion: @escaping(Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
          
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
                            
                            
                            
                            
                            
        //create a task
        let task = URLSession.shared.dataTask(with: urlRequest) {
            data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
        //decode the response to a specific object
            do {
                let result = try
                JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}
