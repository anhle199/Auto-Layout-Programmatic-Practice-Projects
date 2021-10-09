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
    
    let softEggButton: EggButton = {
        let eggButton = EggButton(type: .soft)
        return eggButton
    }()
    
    let mediumEggButton: EggButton = {
        let eggButton = EggButton(type: .medium)
        return eggButton
    }()
    
    let hardEggButton: EggButton = {
        let eggButton = EggButton(type: .hard)
        return eggButton
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
        
        eggsStackView.addArrangedSubview(softEggButton)
        eggsStackView.addArrangedSubview(mediumEggButton)
        eggsStackView.addArrangedSubview(hardEggButton)
        
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
            
            progressBar.heightAnchor.constraint(equalToConstant: 5),
            progressBar.trailingAnchor.constraint(equalTo: timerView.trailingAnchor),
            progressBar.leadingAnchor.constraint(equalTo: timerView.leadingAnchor),
            progressBar.centerYAnchor.constraint(equalTo: timerView.centerYAnchor),
        ])
    }
    
}
