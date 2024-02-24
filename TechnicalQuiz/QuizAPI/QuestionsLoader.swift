//
//  QuestionsLoader.swift
//  TechnicalQuiz
//
//  Created by Александр Плешаков on 24.02.2024.
//

import Foundation

final class QuestionsLoader {
    
    func loadQuestions(handler: @escaping (Result<Questions, Error>) -> Void) {
        NetworkManager.shared.fetch(url: Link.bash.url) { result in
            switch result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let questions = try jsonDecoder.decode(Questions.self, from: data)
                    handler(.success(questions))
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
