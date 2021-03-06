//
//  CalculatorViewController.swift
//  SimpleCalculator
//
//  Created by Le Hoang Anh on 03/10/2021.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 1
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let resultView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 50, weight: .thin)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - First Row Stack View
    let firstRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let allClearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Function.allClear.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.functionButton
        button.tintColor = .label
        
        return button
    }()
    
    let negateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Function.negateButton.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.functionButton
        button.tintColor = .label
        
        return button
    }()
    
    let percentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Function.percent.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.functionButton
        button.tintColor = .label
        
        return button
    }()
    
    let divideButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Operation.divide.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.operationButton
        button.tintColor = .label
        
        return button
    }()
    
    // MARK: - Second Row Stack View
    let secondRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let sevenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Number.seven.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.numberButton
        button.tintColor = .label
        
        return button
    }()
    
    let eightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Number.eight.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.numberButton
        button.tintColor = .label
        
        return button
    }()
    
    let nineButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Number.nine.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.numberButton
        button.tintColor = .label
        
        return button
    }()
    
    let multiplyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Operation.multiply.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.operationButton
        button.tintColor = .label
        
        return button
    }()
    
    // MARK: - Third Row Stack View
    let thirdRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let fourButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Number.four.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.numberButton
        button.tintColor = .label
        
        return button
    }()
    
    let fiveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Number.five.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.numberButton
        button.tintColor = .label
        
        return button
    }()
    
    let sixButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Number.six.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.numberButton
        button.tintColor = .label
        
        return button
    }()
    
    let subtractButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Operation.subtract.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.operationButton
        button.tintColor = .label
        
        return button
    }()
    
    // MARK: - Fourth Row Stack View
    let fourthRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let oneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Number.one.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.numberButton
        button.tintColor = .label
        
        return button
    }()
    
    let twoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Number.two.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.numberButton
        button.tintColor = .label
        
        return button
    }()
    
    let threeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Number.three.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.numberButton
        button.tintColor = .label
        
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Operation.add.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.operationButton
        button.tintColor = .label
        
        return button
    }()
    
    // MARK: - Fifth Row Stack View
    let fifthRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let zeroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Number.zero.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.numberButton
        button.tintColor = .label
        
        return button
    }()
    
    let innerFifthRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let dotButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.SpecialSign.dot.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.specialSignButton
        button.tintColor = .label
        
        return button
    }()
    
    let equalButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CalculatorButton.Operation.equal.title, for: .normal)
        button.titleLabel?.font = Constants.CalculatorButton.font
        button.backgroundColor = Constants.CalculatorButton.Color.operationButton
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
extension CalculatorViewController {
    
    func setupViews() {
        // Adds view's subviews.
        view.addSubview(rootStackView)
        
        // Adds rootRowStackView's subviews.
        rootStackView.addArrangedSubViews([
            resultView,
            firstRowStackView,
            secondRowStackView,
            thirdRowStackView,
            fourthRowStackView,
            fifthRowStackView
        ])
        
        // Adds resultView's subviews.
        resultView.addSubview(resultLabel)
        
        // Adds firstRowStackView's subviews.
        firstRowStackView.addArrangedSubViews([allClearButton, negateButton, percentButton, divideButton])
        
        // Adds secondRowStackView's subviews.
        secondRowStackView.addArrangedSubViews([sevenButton, eightButton, nineButton, multiplyButton])
        
        // Adds thirdRowStackView's subviews.
        thirdRowStackView.addArrangedSubViews([fourButton, fiveButton, sixButton, subtractButton])
        
        // Adds fourthRowStackView's subviews.
        fourthRowStackView.addArrangedSubViews([oneButton, twoButton, threeButton, addButton])
        
        // Adds fifthRowStackView's subviews.
        fifthRowStackView.addArrangedSubViews([zeroButton, innerFifthRowStackView])
        
        // Adds innerFifthRowStackView's subviews.
        innerFifthRowStackView.addArrangedSubViews([dotButton, equalButton])
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        // rootStackView.
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
        
        // resultLabel.
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalToSystemSpacingBelow: resultView.topAnchor, multiplier: 2),
            resultView.trailingAnchor.constraint(equalToSystemSpacingAfter: resultLabel.trailingAnchor, multiplier: 2),
            resultView.bottomAnchor.constraint(equalToSystemSpacingBelow: resultLabel.bottomAnchor, multiplier: 2),
            resultLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: resultView.leadingAnchor, multiplier: 2)
        ])
    }
    
}
