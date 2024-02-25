//
//  QuestionsFactoryDelegate.swift
//  TechnicalQuiz
//
//  Created by Александр Плешаков on 25.02.2024.
//

import Foundation

protocol QuestionsFactoryDelegate {
    func didLoadData()
    func didFailToLoadData()
}
