//
//  ViewController.swift
//  EggTimer
//
//  Created by Le Hoang Anh on 08/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "How do you like your eggs?"
        label.font = .systemFont(ofSize: 30, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .center
        
        return label
    }()

    let eggsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        return stackView
    }()
    
    let softEggView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    let softEggImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.Images.softEgg)
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()
    
    let softEggButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Soft", for: .normal)
        button.tintColor = .label
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .black)
        
        return button
    }()
    
    let mediumEggView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    let mediumEggImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.Images.mediumEgg)
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()
    
    let mediumEggButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Medium", for: .normal)
        button.tintColor = .label
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .black)
        
        return button
    }()

    let hardEggView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    let hardEggImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.Images.hardEgg)
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    let hardEggButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Hard", for: .normal)
        button.tintColor = .label
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .black)
        
        return button
    }()
    
    let timerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    let progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progress = 0
        progressBar.progressTintColor = .systemYellow
        progressBar.trackTintColor = .systemGray
        
        return progressBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.Colors.background
        
        setupViews()
        setupConstraints()
    }

}


// MARK: - Setup Views and Constraints
extension ViewController {
    
    // MARK: - Setup Views
    func setupViews() {
        view.addSubview(rootStackView)
        
        rootStackView.addArrangedSubview(titleView)
        rootStackView.addArrangedSubview(eggsStackView)
        rootStackView.addArrangedSubview(timerView)
        
        titleView.addSubview(titleLabel)
        
        eggsStackView.addArrangedSubview(softEggView)
        softEggView.addSubview(softEggImageView)
        softEggView.addSubview(softEggButton)
        
        eggsStackView.addArrangedSubview(mediumEggView)
        mediumEggView.addSubview(mediumEggImageView)
        mediumEggView.addSubview(mediumEggButton)
        
        eggsStackView.addArrangedSubview(hardEggView)
        hardEggView.addSubview(hardEggImageView)
        hardEggView.addSubview(hardEggButton)
        
        timerView.addSubview(progressBar)
    }

    // MARK: - Setup Constraints
    func setupConstraints() {
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: margins.topAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            
            softEggImageView.topAnchor.constraint(equalTo: softEggView.topAnchor),
            softEggImageView.trailingAnchor.constraint(equalTo: softEggView.trailingAnchor),
            softEggImageView.bottomAnchor.constraint(equalTo: softEggView.bottomAnchor),
            softEggImageView.leadingAnchor.constraint(equalTo: softEggView.leadingAnchor),
            
            softEggButton.centerXAnchor.constraint(equalTo: softEggView.centerXAnchor),
            softEggButton.centerYAnchor.constraint(equalTo: softEggView.centerYAnchor),

            mediumEggImageView.topAnchor.constraint(equalTo: mediumEggView.topAnchor),
            mediumEggImageView.trailingAnchor.constraint(equalTo: mediumEggView.trailingAnchor),
            mediumEggImageView.bottomAnchor.constraint(equalTo: mediumEggView.bottomAnchor),
            mediumEggImageView.leadingAnchor.constraint(equalTo: mediumEggView.leadingAnchor),
            
            mediumEggButton.centerXAnchor.constraint(equalTo: mediumEggView.centerXAnchor),
            mediumEggButton.centerYAnchor.constraint(equalTo: mediumEggView.centerYAnchor),
            
            hardEggImageView.topAnchor.constraint(equalTo: hardEggView.topAnchor),
            hardEggImageView.trailingAnchor.constraint(equalTo: hardEggView.trailingAnchor),
            hardEggImageView.bottomAnchor.constraint(equalTo: hardEggView.bottomAnchor),
            hardEggImageView.leadingAnchor.constraint(equalTo: hardEggView.leadingAnchor),
            
            hardEggButton.centerXAnchor.constraint(equalTo: hardEggView.centerXAnchor),
            hardEggButton.centerYAnchor.constraint(equalTo: hardEggView.centerYAnchor),
            
            progressBar.heightAnchor.constraint(equalToConstant: 5),
            progressBar.trailingAnchor.constraint(equalTo: timerView.trailingAnchor),
            progressBar.leadingAnchor.constraint(equalTo: timerView.leadingAnchor),
            progressBar.centerYAnchor.constraint(equalTo: timerView.centerYAnchor),
        ])
    }
    
}
