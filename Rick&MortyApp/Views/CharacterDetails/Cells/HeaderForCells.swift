//
//  HeaderForCells.swift
//  Rick&MortyApp
//
//  Created by Arina on 19.08.2023.
//

import UIKit

class HeaderForCells: UITableViewHeaderFooterView {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Fonts().gilroySemiBold, size: LocaleConstants.fontSize)
        label.textColor = .white
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(label)
        
        NSLayoutConstraint.activate ([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }
    
    func setupHeaderTitle(title: String) {
        label.text = title
    }
    
}

private extension HeaderForCells {
    
    enum LocaleConstants {
        static let fontSize: CGFloat = 17
    }
    
}
