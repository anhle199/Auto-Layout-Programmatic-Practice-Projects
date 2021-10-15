//
//  HomeViewController.swift
//  Quizzler
//
//  Created by Le Hoang Anh on 14/10/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        return stackView
    }()
    
    // score label
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score: 0"
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    // question label
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Which is the largest organ in the human body?"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    // first answer button
    let firstAnswerButton: UIButton = {
        let button = UIButton()
        button.configAnswerButton(
            title: "Heart",
            titleColor: .white,
            backgroundColor: UIColor(red: 49 / 255.0, green: 59 / 255.0, blue: 93 / 255.0, alpha: 1),
            cornerRadius: 20,
            borderWidth: 5,
            borderColor: UIColor(red: 70 / 255.0, green: 99 / 255.0, blue: 144 / 255.0, alpha: 1)
        )
        button.titleLabel?.font = .systemFont(ofSize: 25)
        
        return button
    }()
    
    // second answer button
    let secondAnswerButton: UIButton = {
        let button = UIButton()
        button.configAnswerButton(
            title: "Skin",
            titleColor: .white,
            backgroundColor: UIColor(red: 49 / 255.0, green: 59 / 255.0, blue: 93 / 255.0, alpha: 1),
            cornerRadius: 20,
            borderWidth: 5,
            borderColor: UIColor(red: 70 / 255.0, green: 99 / 255.0, blue: 144 / 255.0, alpha: 1)
        )
        button.titleLabel?.font = .systemFont(ofSize: 25)
        
        return button
    }()
    
    // third answer button
    let thirdAnswerButton: UIButton = {
        let button = UIButton()
        button.configAnswerButton(
            title: "Large Intensive",
            titleColor: .white,
            backgroundColor: UIColor(red: 49 / 255.0, green: 59 / 255.0, blue: 93 / 255.0, alpha: 1),
            cornerRadius: 20,
            borderWidth: 5,
            borderColor: UIColor(red: 70 / 255.0, green: 99 / 255.0, blue: 144 / 255.0, alpha: 1)
        )
        button.titleLabel?.font = .systemFont(ofSize: 25)
        
        return button
    }()
    
    // progress bar
    let progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0
        progressView.trackTintColor = .white
        progressView.progressTintColor = .green
        
        return progressView
    }()
    
    
    let questions = [
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
    
    var indexQuestion = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 49 / 255.0, green: 59 / 255.0, blue: 93 / 255.0, alpha: 1)
        
        setupViews()
        setupConstraints()
        
        updateUI()
        
        firstAnswerButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        secondAnswerButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        thirdAnswerButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
    }
    
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        if let userAnswer = sender.titleLabel?.text {
            let correctAnswer = questions[indexQuestion].correctAnswer
            
            if userAnswer == correctAnswer {
                score += 1
                sender.backgroundColor = .green
            } else {
                sender.backgroundColor = .red
            }
                        
            if indexQuestion + 1 < questions.count {
                indexQuestion += 1
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                    sender.backgroundColor = UIColor(red: 49 / 255.0, green: 59 / 255.0, blue: 93 / 255.0, alpha: 1)
                    self.updateUI()
                }
            }
        }
    }
    
    func updateUI() {
        let questionText = questions[indexQuestion].text
        let answerShuffled = questions[indexQuestion].answers.shuffled()
        
        scoreLabel.text = "Score: \(score)"
        progressBar.progress = Float(indexQuestion + 1) / Float(questions.count)
        
        questionLabel.text = questionText
        firstAnswerButton.setTitle(answerShuffled[0], for: .normal)
        secondAnswerButton.setTitle(answerShuffled[1], for: .normal)
        thirdAnswerButton.setTitle(answerShuffled[2], for: .normal)
    }
    
    
    func setupViews() {
        view.addSubview(rootStackView)
        
        rootStackView.addArrangedSubview(scoreLabel)
        rootStackView.addArrangedSubview(questionLabel)
        rootStackView.addArrangedSubview(firstAnswerButton)
        rootStackView.addArrangedSubview(secondAnswerButton)
        rootStackView.addArrangedSubview(thirdAnswerButton)
        rootStackView.addArrangedSubview(progressBar)
    }
    
    func setupConstraints() {
        let marginLayout = view.layoutMarginsGuide
        
        // Add constraints for root stack view.
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: marginLayout.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: marginLayout.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: marginLayout.leadingAnchor),
        ])
        
        // Add constraints for score label.
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: rootStackView.topAnchor),
            scoreLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
        ])
        
        // Add constraints for three answer buttons.
        NSLayoutConstraint.activate([
            firstAnswerButton.heightAnchor.constraint(equalToConstant: 80),
            secondAnswerButton.heightAnchor.constraint(equalToConstant: 80),
            thirdAnswerButton.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        // Add constraints for progress bar.
        NSLayoutConstraint.activate([
            progressBar.heightAnchor.constraint(equalToConstant: 10),
        ])
    }
    
}
