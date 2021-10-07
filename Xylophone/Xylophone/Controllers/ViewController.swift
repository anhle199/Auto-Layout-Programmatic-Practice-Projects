//
//  ViewController.swift
//  Xylophone
//
//  Created by Le Hoang Anh on 03/10/2021.
//

import UIKit

class ViewController: UIViewController {

    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        return stackView
    }()
    
    var buttonBackgroundViews = [String: UIView]()
    var buttons = [String: UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
}


// MARK: - Setup Views and Constraints
extension ViewController {
    
    // MARK: - Setup Views
    // Add `rootStackView` to `view`.
    // Create each `backgroundView` and `button` with `buttonTitle`, respectively.
    // Add `button` to the corresponding `backgroundView`.
    // Add all `backgroundView` created to `rootStackView`.
    // Notes:
    //     - All button's properties are declared at Constants.swift file (Constants.Button structure),
    //       including title, font and background color.
    //     - All button background views (UIView) are stored into `buttonBackgroundViews` property.
    //     - All buttons (UIButton) are stored into `buttons` property.
    func setupViews() {
        view.addSubview(rootStackView)
        
        for buttonTitle in Constants.Button.titles {
            let backgroundView = UIView()
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.backgroundColor = .white
            
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = Constants.Button.colors[buttonTitle]
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = Constants.Button.font
            
            buttonBackgroundViews[buttonTitle] = backgroundView
            buttons[buttonTitle] = button
            
            backgroundView.addSubview(button)
            rootStackView.addArrangedSubview(backgroundView)
        }
    }
    
    // MARK: - Setup Constraints
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        var constraints = [
            rootStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        ]
        
        var systemSpacingCount: CGFloat = 1.0
        for buttonTitle in Constants.Button.titles {
            let backgroundView = buttonBackgroundViews[buttonTitle]!
            let button = buttons[buttonTitle]!
            
            constraints.append(contentsOf: [
                button.topAnchor.constraint(equalTo: backgroundView.topAnchor),
                backgroundView.trailingAnchor.constraint(equalToSystemSpacingAfter: button.trailingAnchor, multiplier: systemSpacingCount),
                button.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
                button.leadingAnchor.constraint(equalToSystemSpacingAfter: backgroundView.leadingAnchor, multiplier: systemSpacingCount),
            ])
            
            systemSpacingCount += 1.0
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
