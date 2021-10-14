//
//  EggButton.swift
//  EggTimer
//
//  Created by Le Hoang Anh on 09/10/2021.
//

import UIKit

class EggButton: UIButton {

    let type: EggButtonType
    let backgroundView: EggButtonBackgroundView
    
    init(frame: CGRect, type: EggButtonType = .soft) {
        self.type = type
        self.backgroundView = EggButtonBackgroundView(type: type)
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    convenience init(type: EggButtonType) {
        self.init(frame: .zero, type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundView.isUserInteractionEnabled = false
        addSubview(backgroundView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
}
