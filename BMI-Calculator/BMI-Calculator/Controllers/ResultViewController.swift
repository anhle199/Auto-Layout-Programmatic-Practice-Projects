//
//  ResultViewController.swift
//  BMI-Calculator
//
//  Created by Le Hoang Anh on 26/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "result_background")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let resultLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "YOUR RESULT"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let resultValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let suggestionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let recalculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RECALCULATE", for: .normal)
        button.setTitleColor(
            UIColor(
                red: 127 / 255.0, green: 124 / 255.0, blue: 213 / 255.0, alpha: 1
            ),
            for: .normal
        )
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    private var resultLabelStackViewPortraitHeightConstraint: NSLayoutConstraint?
    private var resultLabelStackViewLandscapeHeightConstraint: NSLayoutConstraint?
    
    private var bmiValue: String?
    private var advice: String?
    private var color: UIColor?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.bmiValue = "0"
        self.advice = "Nothing"
        self.color = .gray
    }

    convenience init(bmiValue: String, advice: String, color: UIColor) {
        self.init()
        
        self.bmiValue = bmiValue
        self.advice = advice
        self.color = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = color ?? UIColor(
            red: 51 / 255.0, green: 123 / 255.0, blue: 197 / 255.0, alpha: 1
        )
        
        resultLabelStackViewPortraitHeightConstraint = resultLabelStackView.heightAnchor.constraint(
            equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.25
        )
        resultLabelStackViewLandscapeHeightConstraint = resultLabelStackView.heightAnchor.constraint(
            equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.5
        )
        
        setupViews()
        setupConstraints()
        
        resultValueLabel.text = bmiValue ?? "19.5"
        suggestionLabel.text = advice ?? "EAT SOME MORE SNACKS!"
        
        recalculateButton.addTarget(
            self, action: #selector(recalculateButtonPressed), for: .touchUpInside
        )
    }
    
    @objc func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(resultLabelStackView)
        view.addSubview(recalculateButton)
        
        resultLabelStackView.addArrangedSubview(label)
        resultLabelStackView.addArrangedSubview(resultValueLabel)
        resultLabelStackView.addArrangedSubview(suggestionLabel)
    }
    
    func setupConstraints() {
        let marginLayout = view.layoutMarginsGuide
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(contentsOf: [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
        
        constraints.append(contentsOf: [
            resultLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabelStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        constraints.append(contentsOf: [
            recalculateButton.trailingAnchor.constraint(equalTo: marginLayout.trailingAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: marginLayout.bottomAnchor),
            recalculateButton.leadingAnchor.constraint(equalTo: marginLayout.leadingAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        updateResultLabelStackViewHeightConstraints()
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        updateResultLabelStackViewHeightConstraints()
        resultLabelStackView.layoutIfNeeded()
    }
    
    func updateResultLabelStackViewHeightConstraints() {
        if UIDevice.current.orientation.isLandscape {
            resultLabelStackViewPortraitHeightConstraint?.isActive = false
            resultLabelStackViewLandscapeHeightConstraint?.isActive = true
        } else {
            resultLabelStackViewLandscapeHeightConstraint?.isActive = false
            resultLabelStackViewPortraitHeightConstraint?.isActive = true
        }
    }
    
}
