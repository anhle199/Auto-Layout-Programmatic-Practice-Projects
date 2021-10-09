//
//  EggButton.swift
//  EggTimer
//
//  Created by Le Hoang Anh on 09/10/2021.
//

import UIKit

class EggButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private let type: EggButtonType
    private let backgroundView: EggButtonBackgroundView
    
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
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
}
