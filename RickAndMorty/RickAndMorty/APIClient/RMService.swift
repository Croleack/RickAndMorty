//
//  RMService.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 17.08.2023.
//

import Foundation
///Основной объект службы API для получения данных  (get)
final class RMService {
    ///общий экзампляр
    static let shared = RMService()
    
    private init() {}
    
    enum RMServiceError: Error {
        //не удалось создать запрос подобные этому
        case failedToCreateRequest
        //не удалось получить данные
        case failedToGetData
        
    }
    
    ///отправляем вызов API
    ///request - экземпляр запроса
    ///completion - обратный вызов с данными или ошибкой 
    
    //мы будем создавать запрос и получать некий данный Void
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
                        completion: @escaping(Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
          
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
                            
                            
                            
                            
                            
        //создаем задачу
        let task = URLSession.shared.dataTask(with: urlRequest) {
            //response - _
            data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
        //декодировать ответ на конкретный объект
            do {
                let result = try
                JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                //error обработчик завершения
                completion(.failure(error))
            }
        }
        task.resume()
    }
    //переведем наш request в url запрос
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}
