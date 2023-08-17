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
    
    ///отправляем вызов API
    ///request - экземпляр запроса
    ///completion - обратный вызов с данными или ошибкой 
    
    //мы будем создавать запрос и получать некий данный Void
    public func execute(_ request: RMRequest, completion: @escaping() -> Void) {
        
    }
}
