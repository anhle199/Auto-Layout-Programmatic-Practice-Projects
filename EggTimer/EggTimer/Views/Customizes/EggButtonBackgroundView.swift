//
//  EggButtonBackgroundView.swift
//  EggTimer
//
//  Created by Le Hoang Anh on 09/10/2021.
//

import UIKit

class EggButtonBackgroundView: UIView {
    
    private let type: EggButtonType
    private let imageView = UIImageView()
    private let label = UILabel()
    
    var currentImage: UIImage? {
        switch type {
        case .soft:
            return UIImage(named: Constants.Images.softEgg)
        case .medium:
            return UIImage(named: Constants.Images.mediumEgg)
        case .hard:
            return UIImage(named: Constants.Images.hardEgg)
        }
    }
    
    var currentTitleLabel: String {
        switch type {
        case .soft:
            return "Soft"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        }
    }
    
    init(frame: CGRect, type: EggButtonType = .soft) {
        self.type = type
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
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = currentImage
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = currentTitleLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .black)
        label.textColor = .white
        addSubview(label)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            label.topAnchor.constraint(equalTo: topAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
}
