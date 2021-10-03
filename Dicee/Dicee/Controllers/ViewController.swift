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
        imageView.image = UIImage(named: Constants.Image.background)
        
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
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let middleView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        
        return uiView
    }()
    
    let bottomView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        
        return uiView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.Image.logo)
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    let twoDicesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 50

        return stackView
    }()

    let leftDiceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.Image.Dice.five)

        return imageView
    }()

    let rightDiceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.Image.Dice.one)

        return imageView
    }()
    
    let rollButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Roll", for: .normal)
        button.backgroundColor = .rollButtonColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    let dicesImage = [
        UIImage(imageLiteralResourceName: Constants.Image.Dice.one),
        UIImage(imageLiteralResourceName: Constants.Image.Dice.two),
        UIImage(imageLiteralResourceName: Constants.Image.Dice.three),
        UIImage(imageLiteralResourceName: Constants.Image.Dice.four),
        UIImage(imageLiteralResourceName: Constants.Image.Dice.five),
        UIImage(imageLiteralResourceName: Constants.Image.Dice.six),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        rollButton.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
    }
    
    @objc func rollButtonPressed(_ sender: UIButton) {
        leftDiceImageView.image = dicesImage.randomElement()
        rightDiceImageView.image = dicesImage.randomElement()
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
        
        // Adds twoDicesStackView's subviews.
        twoDicesStackView.addArrangedSubview(leftDiceImageView)
        twoDicesStackView.addArrangedSubview(rightDiceImageView)
        
        // Adds bottomView's subviews.
        bottomView.addSubview(rollButton)
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
        
        // twoDicesStackView.
        NSLayoutConstraint.activate([
            twoDicesStackView.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            twoDicesStackView.centerYAnchor.constraint(equalTo: middleView.centerYAnchor),
        ])
        
        // rollButton.
        NSLayoutConstraint.activate([
            rollButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            rollButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            rollButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
