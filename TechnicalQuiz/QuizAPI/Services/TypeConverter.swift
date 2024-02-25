//
//  TypeConverter.swift
//  TechnicalQuiz
//
//  Created by Александр Плешаков on 26.02.2024.
//

import Foundation

final class TypeConverter {
    
    static func stringToBool(_ str: String) -> Bool {
        return str.first == "t"
    }
    
    static func tagsToStringArray(tags: [Tag?]) -> [String?] {
        var stringTags: [String?] {
            var array = [String?]()
            for tag in tags {
                array.append(tag?.name)
            }
            return array
        }
        return stringTags
    }
    
    static func answersToStringArray(answers: Answers) -> [String?] {
        var result = [String?]()
        result.append(answers.answerA)
        result.append(answers.answerB)
        result.append(answers.answerC)
        result.append(answers.answerD)
        result.append(answers.answerE)
        result.append(answers.answerF)
        return result
    }
    
    static func correctAnswersToBoolArray(_ correctAnswers: CorrectAnswers) -> [Bool] {
        var result = [Bool]()
        result.append(stringToBool(correctAnswers.answerACorrect))
        result.append(stringToBool(correctAnswers.answerBCorrect))
        result.append(stringToBool(correctAnswers.answerCCorrect))
        result.append(stringToBool(correctAnswers.answerDCorrect))
        result.append(stringToBool(correctAnswers.answerECorrect))
        result.append(stringToBool(correctAnswers.answerFCorrect))
        return result
    }
    
    static func questionsToQuizQuestions(questions: Questions) -> [QuizQuestion] {
        var result = [QuizQuestion]()
        for question in questions {
            let tags = tagsToStringArray(tags: question.tags)
            let quizQuestion = QuizQuestion(
                id: question.id, question: question.question,
                answers: answersToStringArray(answers: question.answers),
                correctAnswers: correctAnswersToBoolArray(question.correctAnswers),
                multipleCorrectAnswers: stringToBool(question.multipleCorrectAnswers),
                correctAnswer: question.correctAnswer,
                tags: tags, category: question.category,
                difficulty: question.difficulty)
            result.append(quizQuestion)
        }
        
        return result
    }
}
