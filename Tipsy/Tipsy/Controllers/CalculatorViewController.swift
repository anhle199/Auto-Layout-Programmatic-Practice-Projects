//
//  ViewController.swift
//  Tipsy
//
//  Created by Le Hoang Anh on 16/01/2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let bottomBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 215 / 255.0, green: 249 / 255.0, blue: 235 / 255.0, alpha: 1)
        
        return view
    }()
    
    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        return stackView
    }()
    
    let billTotalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    let billTotalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter bill total"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .left
        
        return label
    }()
    
    let billTotalTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "e.g. 123.56"
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 40)
        textField.textColor = UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1)
        textField.minimumFontSize = 17
        textField.keyboardType = .decimalPad
        
        return textField
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    let tipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let tipPercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select tip"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .left
        
        return label
    }()
    
    let tipPercentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let zeroPercentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("0%", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitleColor(
            UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1),
            for: .normal
        )
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    let tenPercentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("10%", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitleColor(
            UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1),
            for: .normal
        )
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    let twentyPercentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("20%", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitleColor(
            UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1),
            for: .normal
        )
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    let chooseSplitterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose split"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .left
        
        return label
    }()
    
    let chooseSplitterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        return stackView
    }()
    
    let splitterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2"
        label.font = .systemFont(ofSize: 35)
        label.textColor = UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    let stepperButton: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.value = 2
        stepper.maximumValue = 25
        stepper.minimumValue = 2
        stepper.stepValue = 1
        stepper.contentVerticalAlignment = .center
        stepper.contentHorizontalAlignment = .center
        
        return stepper
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.backgroundColor = UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1)
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    var billTotal = 0.0
    var tipPercent = 0.0
    var numberOfPeople = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
        zeroPercentButton.addTarget(self, action: #selector(tipPercentButtonPressed), for: .touchUpInside)
        tenPercentButton.addTarget(self, action: #selector(tipPercentButtonPressed), for: .touchUpInside)
        twentyPercentButton.addTarget(self, action: #selector(tipPercentButtonPressed), for: .touchUpInside)
        stepperButton.addTarget(self, action: #selector(numberOfPeopleChanged), for: .valueChanged)
        calculateButton.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
    }

    @objc func tipPercentButtonPressed(_ sender: UIButton) {
        if let percentAsString = sender.titleLabel?.text,
           let percentValue = Double(String(percentAsString.dropLast())) {
            
            tipPercent = percentValue / 100.0
        }
        
        billTotalTextField.endEditing(true)
        
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
        
        resetColorTipButtons()
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1)
    }
    
    @objc func numberOfPeopleChanged(_ sender: UIStepper) {
        numberOfPeople = Int(stepperButton.value)
        splitterLabel.text = "\(numberOfPeople)"
    }
    
    @objc func calculateButtonPressed(_ sender: UIButton) {
        if let billTotal = Double(billTotalTextField.text ?? "0") {
            self.billTotal = billTotal
            let totalPerPerson = (billTotal * (tipPercent + 1.0)) / Double(numberOfPeople)
            
            let resultVC = ResultViewController(
                totalPerPerson: totalPerPerson,
                numberOfPeople: numberOfPeople,
                tipPercent: tipPercent
            )
            present(resultVC, animated: true, completion: nil)
        }
    }
    
    func resetColorTipButtons() {
        zeroPercentButton.setTitleColor(
            UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1),
            for: .normal
        )
        tenPercentButton.setTitleColor(
            UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1),
            for: .normal
        )
        twentyPercentButton.setTitleColor(
            UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1),
            for: .normal
        )
        
        zeroPercentButton.backgroundColor = .clear
        tenPercentButton.backgroundColor = .clear
        twentyPercentButton.backgroundColor = .clear
    }
    
    
    func setupViews() {
        view.addSubview(bottomBackgroundView)
        view.addSubview(rootStackView)

        rootStackView.addArrangedSubview(billTotalStackView)
        rootStackView.addArrangedSubview(bottomView)

        billTotalStackView.addArrangedSubview(billTotalLabel)
        billTotalStackView.addArrangedSubview(billTotalTextField)

        bottomView.addSubview(tipStackView)
        bottomView.addSubview(calculateButton)

        tipStackView.addArrangedSubview(tipPercentLabel)
        tipStackView.addArrangedSubview(tipPercentsStackView)
        tipStackView.addArrangedSubview(chooseSplitterLabel)
        tipStackView.addArrangedSubview(chooseSplitterStackView)

        tipPercentsStackView.addArrangedSubview(zeroPercentButton)
        tipPercentsStackView.addArrangedSubview(tenPercentButton)
        tipPercentsStackView.addArrangedSubview(twentyPercentButton)

        chooseSplitterStackView.addArrangedSubview(splitterLabel)
        chooseSplitterStackView.addArrangedSubview(stepperButton)
    }
    
    func setupConstraints() {
        let marginLayout = view.layoutMarginsGuide
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(contentsOf: [
            bottomBackgroundView.topAnchor.constraint(equalTo: tipStackView.topAnchor),
            bottomBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            rootStackView.topAnchor.constraint(equalTo: marginLayout.topAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: marginLayout.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: marginLayout.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: marginLayout.leadingAnchor),
        ])
        
        constraints.append(contentsOf: [
            billTotalStackView.topAnchor.constraint(equalTo: rootStackView.topAnchor),
            billTotalStackView.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor),
            billTotalStackView.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor),

            bottomView.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor),
            bottomView.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: rootStackView.bottomAnchor),
        ])

        constraints.append(contentsOf: [
            billTotalLabel.heightAnchor.constraint(equalToConstant: 30),
            billTotalTextField.heightAnchor.constraint(equalToConstant: 48),
        ])

        constraints.append(contentsOf: [
            tipStackView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            tipStackView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            tipStackView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),

            chooseSplitterLabel.heightAnchor.constraint(equalTo: stepperButton.heightAnchor),


            calculateButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            calculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate(constraints)
    }

}

