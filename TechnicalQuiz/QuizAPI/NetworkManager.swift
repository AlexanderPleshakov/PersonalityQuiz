//
//  NetworkManager.swift
//  TechnicalQuiz
//
//  Created by Александр Плешаков on 23.02.2024.
//

import Foundation

enum Link {
    case bash
    
    var url: URL {
        switch self {
        case .bash:
            #warning("change link!")
            return URL(string: "")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    var questions: Questions?
    
    init() {}
    
    func fetchBash() {
        let fetchRequest = URLRequest(url: Link.bash.url)
        
        let task = URLSession.shared.dataTask(with: fetchRequest) { [weak self] (data, response, error) -> Void in
            if error != nil {
                print(String(describing: error))
                return
            }
            
            let httpResponse = response as? HTTPURLResponse
            print("code:" + String(describing: httpResponse?.statusCode))
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            if let questions = try? jsonDecoder.decode(Questions.self, from: data) {
                //print(questions)
                self?.questions = questions
            } else {
                print("decode error")
            }
        }
        task.resume()
    }
}
