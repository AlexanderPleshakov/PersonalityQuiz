//
//  NetworkManager.swift
//  TechnicalQuiz
//
//  Created by Александр Плешаков on 23.02.2024.
//

import Foundation

enum Link {
    
    case bash
    
    var apiKey: String {
        "FY1R5gHmAcC0DxBKBT9cY8WsYK5zkwIt6pF1KkLd"
    }
    
    var url: URL {
        switch self {
        case .bash:
            return URL(string: "https://quizapi.io/api/v1/questions?apiKey=\(apiKey)&limit=10")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    init() {}
    
    enum NetworkError: Error {
        case codeError
    }
    
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void) {
        let fetchRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: fetchRequest) { [weak self] (data, response, error) -> Void in
            if let error = error {
                print(String(describing: "Ошибка fetch: \(error)"))
                handler(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode < 200 || response.statusCode >= 300 {
                    handler(.failure(NetworkError.codeError))
                    return
                }
            }
            
            
            guard let data = data else {
                return
            }
            handler(.success(data))
            
            
        }
        task.resume()
    }
}
