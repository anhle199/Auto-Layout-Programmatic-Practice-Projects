//
//  QuizManager.swift
//  Quizzler
//
//  Created by Le Hoang Anh on 22/10/2021.
//

struct QuizManager {
    
    private var questions = Question.makeShuffle(Constants.questions)
    private var indexQuestion = 0
    private var score = 0
    
    var countQuestions: Int { questions.count }
    
    var currentQuestion: Question { questions[indexQuestion] }
    
    var currentScore: Int { score }
    
    var currentProgressValue: Float {
        Float(indexQuestion + 1) / Float(questions.count)
    }
    
    mutating func shuffle() {
        self.questions = Question.makeShuffle(questions)
    }
    
    mutating func checkUserAnswer(
        _ userAnswer: String,
        onCorrect: () -> Void,
        onIncorrect: () -> Void
    ) {
        if userAnswer == questions[indexQuestion].correctAnswer {
            self.score += Constants.scorePerQuestion
            onCorrect()
        } else {
            onIncorrect()
        }
    }
    
    mutating func nextQuestion() {
        if indexQuestion < questions.count - 1 {
            self.indexQuestion += 1
        } else {
            self.indexQuestion = 0
            self.score = 0
            shuffle()
        }
    }
    
}
