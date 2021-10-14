//
//  ViewController.swift
//  Quizzler
//
//  Created by Le Hoang Anh on 14/10/2021.
//

import UIKit

class ViewController: UIViewController {

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
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .red
        
        return label
    }()
    
    // question label
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Which is the largest organ in the human body?"
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .blue
        
        return label
    }()
    
    // first answer button
    let firstAnswerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.setTitle("Heart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    // second answer button
    let secondAnswerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.setTitle("Skin", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    // third answer button
    let thirdAnswerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.setTitle("Large Intestine", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    // progress bar
    let progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.5
        progressView.trackTintColor = .white
        progressView.progressTintColor = .green
        
        return progressView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .init(red: 49 / 255.0, green: 59 / 255.0, blue: 93 / 255.0, alpha: 1)
        
        setupViews()
        setupConstraints()
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
