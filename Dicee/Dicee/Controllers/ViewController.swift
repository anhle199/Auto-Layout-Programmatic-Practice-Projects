//
//  ViewController.swift
//  Dicee
//
//  Created by Le Hoang Anh on 02/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "GreenBackground")
        
        return imageView
    }()
    
    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let topView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .red
        return uiView
    }()
    
    let middleView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .green
        return uiView
    }()
    
    let bottomView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .blue
        return uiView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "DiceeLogo")
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    let twoDicesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 50

        return stackView
    }()

    let leftDiceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "DiceFive"), for: .normal)
        button.tintColor = .label

        return button
    }()

    let rightDiceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "DiceOne"), for: .normal)
        button.tintColor = .label

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
}


// MARK: - Setup Views and Constraints
extension ViewController {
    
    // MARK: - Setup Views
    func setupViews() {
        // Adds view's subviews.
        view.addSubview(backgroundImageView)
        view.addSubview(rootStackView)
        
        // Adds rootStackView's subviews.
        rootStackView.addArrangedSubview(topView)
        rootStackView.addArrangedSubview(middleView)
        rootStackView.addArrangedSubview(bottomView)
        
        // Adds topView's subviews.
        topView.addSubview(logoImageView)
        
        // Adds middleView's subviews.
        middleView.addSubview(twoDicesStackView)
        
//        Adds twoDicesStackView's subviews.
        twoDicesStackView.addArrangedSubview(leftDiceButton)
        twoDicesStackView.addArrangedSubview(rightDiceButton)
    }
    
    // MARK: - Setup Constraints
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        // backgroundImageView.
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        // rootStackView.
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        ])
        
        // logoImageView.
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            twoDicesStackView.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            twoDicesStackView.centerYAnchor.constraint(equalTo: middleView.centerYAnchor),
        ])
    }
    
}
