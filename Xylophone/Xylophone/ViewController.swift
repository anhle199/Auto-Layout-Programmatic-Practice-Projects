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
    
    // MARK: - C
    let CView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let CButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("C", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .regular)
        
        return button
    }()
    
    // MARK: - D
    let DView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let DButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 255 / 255.0, green: 149 / 255.0, blue: 0 / 255.0, alpha: 1)
        button.setTitle("D", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .regular)
        
        return button
    }()
    
    // MARK: - E
    let EView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let EButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 255 / 255.0, green: 204 / 255.0, blue: 2 / 255.0, alpha: 1)
        button.setTitle("E", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .regular)
        
        return button
    }()
    
    // MARK: - F
    let FView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let FButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 53 / 255.0, green: 199 / 255.0, blue: 89 / 255.0, alpha: 1)
        button.setTitle("F", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .regular)
        
        return button
    }()
    
    // MARK: - G
    let GView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let GButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 88 / 255.0, green: 86 / 255.0, blue: 213 / 255.0, alpha: 1)
        button.setTitle("G", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .regular)
        
        return button
    }()
    
    // MARK: - A
    let AView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let AButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0 / 255.0, green: 122 / 255.0, blue: 255 / 255.0, alpha: 1)
        button.setTitle("A", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .regular)
        
        return button
    }()
    
    // MARK: - B
    let BView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let BButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 175 / 255.0, green: 82 / 255.0, blue: 222 / 255.0, alpha: 1)
        button.setTitle("B", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .regular)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
}


extension ViewController {
    
    func setupViews() {
        view.addSubview(rootStackView)
        
        rootStackView.addArrangedSubview(CView)
        CView.addSubview(CButton)
        
        rootStackView.addArrangedSubview(DView)
        DView.addSubview(DButton)
        
        rootStackView.addArrangedSubview(EView)
        EView.addSubview(EButton)
        
        rootStackView.addArrangedSubview(FView)
        FView.addSubview(FButton)
        
        rootStackView.addArrangedSubview(GView)
        GView.addSubview(GButton)
        
        rootStackView.addArrangedSubview(AView)
        AView.addSubview(AButton)
        
        rootStackView.addArrangedSubview(BView)
        BView.addSubview(BButton)
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            CButton.topAnchor.constraint(equalTo: CView.topAnchor),
            CView.trailingAnchor.constraint(equalToSystemSpacingAfter: CButton.trailingAnchor, multiplier: 1),
            CButton.bottomAnchor.constraint(equalTo: CView.bottomAnchor),
            CButton.leadingAnchor.constraint(equalToSystemSpacingAfter: CView.leadingAnchor, multiplier: 1),
        ])
        
        NSLayoutConstraint.activate([
            DButton.topAnchor.constraint(equalTo: DView.topAnchor),
            DView.trailingAnchor.constraint(equalToSystemSpacingAfter: DButton.trailingAnchor, multiplier: 2),
            DButton.bottomAnchor.constraint(equalTo: DView.bottomAnchor),
            DButton.leadingAnchor.constraint(equalToSystemSpacingAfter: DView.leadingAnchor, multiplier: 2),
        ])
        
        NSLayoutConstraint.activate([
            EButton.topAnchor.constraint(equalTo: EView.topAnchor),
            EView.trailingAnchor.constraint(equalToSystemSpacingAfter: EButton.trailingAnchor, multiplier: 3),
            EButton.bottomAnchor.constraint(equalTo: EView.bottomAnchor),
            EButton.leadingAnchor.constraint(equalToSystemSpacingAfter: EView.leadingAnchor, multiplier: 3),
        ])
        
        NSLayoutConstraint.activate([
            FButton.topAnchor.constraint(equalTo: FView.topAnchor),
            FView.trailingAnchor.constraint(equalToSystemSpacingAfter: FButton.trailingAnchor, multiplier: 4),
            FButton.bottomAnchor.constraint(equalTo: FView.bottomAnchor),
            FButton.leadingAnchor.constraint(equalToSystemSpacingAfter: FView.leadingAnchor, multiplier: 4),
        ])
        
        NSLayoutConstraint.activate([
            GButton.topAnchor.constraint(equalTo: GView.topAnchor),
            GView.trailingAnchor.constraint(equalToSystemSpacingAfter: GButton.trailingAnchor, multiplier: 5),
            GButton.bottomAnchor.constraint(equalTo: GView.bottomAnchor),
            GButton.leadingAnchor.constraint(equalToSystemSpacingAfter: GView.leadingAnchor, multiplier: 5),
        ])
        
        NSLayoutConstraint.activate([
            AButton.topAnchor.constraint(equalTo: AView.topAnchor),
            AView.trailingAnchor.constraint(equalToSystemSpacingAfter: AButton.trailingAnchor, multiplier: 6),
            AButton.bottomAnchor.constraint(equalTo: AView.bottomAnchor),
            AButton.leadingAnchor.constraint(equalToSystemSpacingAfter: AView.leadingAnchor, multiplier: 6),
        ])
        
        NSLayoutConstraint.activate([
            BButton.topAnchor.constraint(equalTo: BView.topAnchor),
            BView.trailingAnchor.constraint(equalToSystemSpacingAfter: BButton.trailingAnchor, multiplier: 7),
            BButton.bottomAnchor.constraint(equalTo: BView.bottomAnchor),
            BButton.leadingAnchor.constraint(equalToSystemSpacingAfter: BView.leadingAnchor, multiplier: 7),
        ])
    }
    
}
