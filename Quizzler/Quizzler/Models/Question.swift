//
//  Question.swift
//  Quizzler
//
//  Created by Le Hoang Anh on 15/10/2021.
//

import Foundation

struct Question {
    
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    static func makeShuffle(_ questions: [Question]) -> [Question] {
        questions
            .map { question in
                return Question(
                    text: question.text,
                    answers: question.answers.shuffled(),
                    correctAnswer: question.correctAnswer
                )
            }
            .shuffled()
    }
    
}
