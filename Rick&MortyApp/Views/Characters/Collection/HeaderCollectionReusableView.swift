//
//  HeaderCollectionReusableView.swift
//  Rick&MortyApp
//
//  Created by Arina on 19.08.2023.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = Texts().charactersTitle
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: Fonts().gilroyBold, size: LocaleConstants.fontSize)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    public func config() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: LocaleConstants.anchorConstantLeft),
        ])
    }
}

private extension HeaderCollectionReusableView {
    
    enum LocaleConstants {
        static let fontSize: CGFloat = 28
        static let anchorConstantLeft: CGFloat = 4
    }
    
}
