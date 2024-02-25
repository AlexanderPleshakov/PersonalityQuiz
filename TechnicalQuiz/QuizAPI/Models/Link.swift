//
//  Link.swift
//  TechnicalQuiz
//
//  Created by Александр Плешаков on 26.02.2024.
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
