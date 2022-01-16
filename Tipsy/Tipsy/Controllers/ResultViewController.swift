//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Le Hoang Anh on 16/01/2022.
//

import UIKit

class ResultViewController: UIViewController {

    let topBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 215 / 255.0, green: 249 / 255.0, blue: 235 / 255.0, alpha: 1)
        
        return view
    }()
    
    let totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total per person"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .lightGray
        label.textAlignment = .center
        
        return label
    }()
    
    let totalPerPersonValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "56.32"
        label.font = .systemFont(ofSize: 45)
        label.textColor = UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    let splitDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Split between 2 people, with 10% tip."
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    let recalculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recalculate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.backgroundColor = UIColor(red: 0, green: 176 / 255.0, blue: 107 / 255.0, alpha: 1)
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    private var totalPerPerson: Double?
    private var numberOfPeople: Int?
    private var tipPercent: Int?
    
    convenience init(totalPerPerson: Double, numberOfPeople: Int, tipPercent: Double) {
        self.init()
        
        self.totalPerPerson = totalPerPerson
        self.numberOfPeople = numberOfPeople
        self.tipPercent = Int(tipPercent * 100.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
        totalPerPersonValueLabel.text = String(format: "%.2f", totalPerPerson ?? 0.0)
        splitDetailLabel.text = "Split between \(numberOfPeople ?? 2) people, with \(tipPercent ?? 0)%"
        
        recalculateButton.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
    }
    
    @objc func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupViews() {
        view.addSubview(topBackgroundView)
        view.addSubview(splitDetailLabel)
        view.addSubview(recalculateButton)
        
        topBackgroundView.addSubview(totalPerPersonLabel)
        topBackgroundView.addSubview(totalPerPersonValueLabel)
    }
    
    func setupConstraints() {
        let marginLayout = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate( [
            topBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            splitDetailLabel.topAnchor.constraint(equalToSystemSpacingBelow: topBackgroundView.bottomAnchor, multiplier: 2),
            splitDetailLabel.trailingAnchor.constraint(equalTo: marginLayout.trailingAnchor),
            splitDetailLabel.leadingAnchor.constraint(equalTo: marginLayout.leadingAnchor),
            
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            recalculateButton.heightAnchor.constraint(equalToConstant: 54),
            recalculateButton.bottomAnchor.constraint(equalTo: marginLayout.bottomAnchor),
            
            totalPerPersonLabel.centerYAnchor.constraint(equalTo: topBackgroundView.centerYAnchor),
            totalPerPersonLabel.trailingAnchor.constraint(equalTo: topBackgroundView.trailingAnchor),
            totalPerPersonLabel.leadingAnchor.constraint(equalTo: topBackgroundView.leadingAnchor),
            
            totalPerPersonValueLabel.topAnchor.constraint(equalToSystemSpacingBelow: totalPerPersonLabel.bottomAnchor, multiplier: 1),
            totalPerPersonValueLabel.trailingAnchor.constraint(equalTo: topBackgroundView.trailingAnchor),
            totalPerPersonValueLabel.leadingAnchor.constraint(equalTo: topBackgroundView.leadingAnchor),
        ])
    }
    
}
