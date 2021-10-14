//
//  ViewController.swift
//  EggTimer
//
//  Created by Le Hoang Anh on 08/10/2021.
//

import UIKit
import AVFoundation

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
        label.text = Constants.titleLabelBeforeBurning
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
    
    var totalTime = 0
    var secondPassed = 0
    var timer = Timer()
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.Colors.background
        
        setupViews()
        setupConstraints()
        
        softEggButton.addTarget(self, action: #selector(eggButtonPressed), for: .touchUpInside)
        mediumEggButton.addTarget(self, action: #selector(eggButtonPressed), for: .touchUpInside)
        hardEggButton.addTarget(self, action: #selector(eggButtonPressed), for: .touchUpInside)
    }
    
    func getBurningTime(of type: EggButtonType) -> Int {
        switch type {
        case .soft:
            return Constants.BurningTime.softEgg
        case .medium:
            return Constants.BurningTime.mediumEgg
        case .hard:
            return Constants.BurningTime.hardEgg
        }
    }
    
    func getButtonTitle(of type: EggButtonType) -> String {
        switch type {
        case .soft:
            return Constants.ButtonTitle.softEgg
        case .medium:
            return Constants.ButtonTitle.mediumEgg
        case .hard:
            return Constants.ButtonTitle.hardEgg
        }
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


// MARK: - EggButton Action
extension ViewController {
    
    @objc func eggButtonPressed(_ sender: EggButton) {
        timer.invalidate()
        secondPassed = 0
        totalTime = getBurningTime(of: sender.type)
        titleLabel.text = "\(getButtonTitle(of: sender.type)) egg is being burned..."
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            
        } else {
            timer.invalidate()
            progressBar.progress = 0
            titleLabel.text = Constants.titleLabelBurnFinished
            playSound()
        }
    }
    
}


// MARK: - Audio Player
extension ViewController {
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: Constants.Sounds.alarm, withExtension: nil) else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
