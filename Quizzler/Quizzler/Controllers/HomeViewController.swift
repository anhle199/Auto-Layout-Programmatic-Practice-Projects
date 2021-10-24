//
//  HomeViewController.swift
//  Quizzler
//
//  Created by Le Hoang Anh on 14/10/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    // Root stack view
    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        return stackView
    }()
    
    // Score label
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score: 0"
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    // Question label
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.dummyQuestion.text
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    // Three answer buttons
    let answerButtons: [UIButton] = {
        Constants.dummyQuestion.answers.map { answerText in
            let button = UIButton()
            button.configAnswerButton(
                title: answerText,
                titleColor: .white,
                backgroundColor: Constants.AnswerButton.backgroundColor,
                cornerRadius: Constants.AnswerButton.cornerRadius,
                borderWidth: Constants.AnswerButton.borderWidth,
                borderColor: Constants.AnswerButton.borderColor
            )
            button.titleLabel?.font = .systemFont(ofSize: Constants.AnswerButton.labelFontSize)
            
            return button
        }
    }()
    
    // Progress bar
    let progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0
        progressView.trackTintColor = .white
        progressView.progressTintColor = .green
        
        return progressView
    }()
    
    
    var quizManager = QuizManager()
    
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.App.backgroundColor
        
        setupViews()
        setupConstraints()
        
        updateUI()
        
        answerButtons.forEach { button in
            button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        }
    }
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        if let userAnswer = sender.titleLabel?.text {
            quizManager.checkUserAnswer(
                userAnswer,
                onCorrect: { sender.backgroundColor = .green },
                onIncorrect: { sender.backgroundColor = .red }
            )
            
            quizManager.nextQuestion()
            Timer.scheduledTimer(
                timeInterval: 0.2,
                target: self,
                selector: #selector(updateUI),
                userInfo: nil,
                repeats: false
            )
        }
    }
    
    @objc func updateUI() {
        let question = quizManager.currentQuestion
        
        scoreLabel.text = "Score: \(quizManager.currentScore)"
        progressBar.progress = quizManager.currentProgressValue
        
        questionLabel.text = question.text
        
        for index in 0 ..< question.answers.count {
            answerButtons[index].backgroundColor = Constants.AnswerButton.backgroundColor
            answerButtons[index].setTitle(question.answers[index], for: .normal)
        }
    }
    
}


// MARK: - Setup Views and Setup Constraints
extension HomeViewController {
    
    func setupViews() {
        view.addSubview(rootStackView)
        
        rootStackView.addArrangedSubview(scoreLabel)
        rootStackView.addArrangedSubview(questionLabel)
        rootStackView.addArrangedSubviews(answerButtons)
        rootStackView.addArrangedSubview(progressBar)
    }
    
    func setupConstraints() {
        let marginLayout = view.layoutMarginsGuide
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(contentsOf: [
            // Add constraints for root stack view.
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: marginLayout.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: marginLayout.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: marginLayout.leadingAnchor),
            
            // Add constraints for score label.
            scoreLabel.topAnchor.constraint(equalTo: rootStackView.topAnchor),
            scoreLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
            
            // Add constraints for progress bar.
            progressBar.heightAnchor.constraint(equalToConstant: 10),
        ])
        
        // Add constraints for three answer buttons.
        constraints.append(contentsOf: answerButtons.map { $0.heightAnchor.constraint(equalToConstant: 80) })
        
        // Actives all constraints.
        NSLayoutConstraint.activate(constraints)
    }
    
}
