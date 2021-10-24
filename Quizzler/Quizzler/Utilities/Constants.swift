//
//  Constants.swift
//  Quizzler
//
//  Created by Le Hoang Anh on 22/10/2021.
//

import UIKit

struct Constants {
    
    static let scorePerQuestion = 5
    
    static let dummyQuestion = Question(
        text: "Which is app name?",
        answers: ["Quiz Machine", "Quizzler", "I do not know"],
        correctAnswer: "Quizzler"
    )
    
    static let questions = [
        Question(
            text: "Which is the largest organ in the human body?",
            answers: ["Heart", "Skin", "Large Intestine"],
            correctAnswer: "Skin"
        ),
        Question(
            text: "Five dollars is worth how many nickels?",
            answers: ["25", "50", "100"],
            correctAnswer: "100"
        ),
        Question(
            text: "What do the letters in the GMT time zone stand for?",
            answers: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"],
            correctAnswer: "Greenwich Mean Time"
        ),
        Question(
            text: "What is the French word for 'hat'?",
            answers: ["Chapeau", "Écharpe", "Bonnet"],
            correctAnswer: "Chapeau"
        ),
        Question(
            text: "In past times, what would a gentleman keep in his fob pocket?",
            answers: ["Notebook", "Handkerchief", "Watch"],
            correctAnswer: "Watch"
        ),
        Question(
            text: "How would one say goodbye in Spanish?",
            answers: ["Au Revoir", "Adiós", "Salir"],
            correctAnswer: "Adiós"
        ),
        Question(
            text: "Which of these colours is NOT featured in the logo for Google?",
            answers: ["Green", "Orange", "Blue"],
            correctAnswer: "Orange"
        ),
        Question(
            text: "What alcoholic drink is made from molasses?",
            answers: ["Rum", "Whisky", "Gin"],
            correctAnswer: "Rum"
        ),
        Question(
            text: "What type of animal was Harambe?",
            answers: ["Panda", "Gorilla", "Crocodile"],
            correctAnswer: "Gorilla"
        ),
        Question(
            text: "Where is Tasmania located?",
            answers: ["Indonesia", "Australia", "Scotland"],
            correctAnswer: "Australia"
        ),
    ]
 
    struct App {
        static let backgroundColor = UIColor(red: 49 / 255.0, green: 59 / 255.0, blue: 93 / 255.0, alpha: 1)
    }
    
    struct AnswerButton {
        static let backgroundColor = UIColor(red: 49 / 255.0, green: 59 / 255.0, blue: 93 / 255.0, alpha: 1)
        static let borderColor = UIColor(red: 70 / 255.0, green: 99 / 255.0, blue: 144 / 255.0, alpha: 1)
        static let cornerRadius: CGFloat = 20.0
        static let borderWidth: CGFloat = 5.0
        static let labelFontSize: CGFloat = 25.0
        
    }
    
}
