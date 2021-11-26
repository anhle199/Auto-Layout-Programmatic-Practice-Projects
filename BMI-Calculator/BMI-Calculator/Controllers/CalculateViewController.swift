//
//  CalculateViewController.swift
//  BMI-Calculator
//
//  Created by Le Hoang Anh on 24/11/2021.
//

import UIKit

class CalculateViewController: UIViewController {

    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "calculate_background")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        
        return stackView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CALCULATE YOUR BMI"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .darkGray
        
        return label
    }()
    
    let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let heightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        return stackView
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height"
        label.textColor = .gray
        label.textAlignment = .left
        
        return label
    }()
    
    let heightValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .right
        
        return label
    }()
    
    let heightSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 2
        slider.value = 1
        slider.thumbTintColor = UIColor(
            red: 140 / 255.0, green: 138 / 255.0, blue: 210 / 255.0, alpha: 1
        )
        slider.minimumTrackTintColor = UIColor(
            red: 188 / 255.0, green: 189 / 255.0, blue: 231 / 255.0, alpha: 1
        )
        
        return slider
    }()
    
    let weightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight"
        label.textColor = .gray
        label.textAlignment = .left
        
        return label
    }()
    
    let weightValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .right
        
        return label
    }()
    
    let weightSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 200
        slider.value = 100
        slider.thumbTintColor = UIColor(
            red: 140 / 255.0, green: 138 / 255.0, blue: 210 / 255.0, alpha: 1
        )
        slider.minimumTrackTintColor = UIColor(
            red: 188 / 255.0, green: 189 / 255.0, blue: 231 / 255.0, alpha: 1
        )
        
        return slider
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CALCULATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(
            red: 98 / 255.0, green: 95 / 255.0, blue: 157 / 255.0, alpha: 1
        )
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    var labelPortraitHeightConstraint: NSLayoutConstraint?
    var labelLandscapeHeightConstraint: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        labelPortraitHeightConstraint = label.heightAnchor.constraint(
            equalTo: rootStackView.heightAnchor, multiplier: 0.65
        )
        labelLandscapeHeightConstraint = label.heightAnchor.constraint(
            equalTo: rootStackView.heightAnchor, multiplier: 0.4
        )
        
        setupViews()
        setupConstraints()
        
        heightSlider.addTarget(
            self, action: #selector(heightSliderChanged), for: .valueChanged
        )
        weightSlider.addTarget(
            self, action: #selector(weightSliderChanged), for: .valueChanged
        )
        calculateButton.addTarget(
            self, action: #selector(calculateButtonPressed), for: .touchUpInside
        )
    }
    
    @objc func heightSliderChanged(_ sender: UISlider) {
        let heightValue = String(format: "%.2f", heightSlider.value)
        heightValueLabel.text = "\(heightValue)m"
    }
    
    @objc func weightSliderChanged(_ sender: UISlider) {
        let heightValue = String(format: "%.2f", weightSlider.value)
        weightValueLabel.text = "\(heightValue)m"
    }
    
    @objc func calculateButtonPressed(_ sender: UIButton) {
        let resultVC = ResultViewController()
        present(resultVC, animated: true, completion: nil)
    }
    

    func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(rootStackView)
        
        rootStackView.addArrangedSubview(label)
        rootStackView.addArrangedSubview(bottomStackView)
        bottomStackView.addArrangedSubview(heightStackView)
        bottomStackView.addArrangedSubview(heightSlider)
        bottomStackView.addArrangedSubview(weightStackView)
        bottomStackView.addArrangedSubview(weightSlider)
        bottomStackView.addArrangedSubview(calculateButton)
        
        heightStackView.addArrangedSubview(heightLabel)
        heightStackView.addArrangedSubview(heightValueLabel)
        
        weightStackView.addArrangedSubview(weightLabel)
        weightStackView.addArrangedSubview(weightValueLabel)
        
        heightValueLabel.text = "\(heightSlider.value)m"
        weightValueLabel.text = "\(weightSlider.value)kg"
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
            rootStackView.topAnchor.constraint(equalTo: marginLayout.topAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: marginLayout.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: marginLayout.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: marginLayout.leadingAnchor),
        ])
     
        updateLabelHeightConstraint()
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewWillTransition(
        to size: CGSize,
        with coordinator: UIViewControllerTransitionCoordinator
    ) {
        super.viewWillTransition(to: size, with: coordinator)
        
        updateLabelHeightConstraint()
        label.layoutIfNeeded()
        bottomStackView.layoutIfNeeded()
    }
 
    func updateLabelHeightConstraint() {
        if UIDevice.current.orientation.isLandscape {
            labelPortraitHeightConstraint?.isActive = false
            labelLandscapeHeightConstraint?.isActive = true
        } else {
            labelLandscapeHeightConstraint?.isActive = false
            labelPortraitHeightConstraint?.isActive = true
        }
    }
    
}
