//
//  HeaderCell.swift
//  Rick&MortyApp
//
//  Created by Arina on 19.08.2023.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    private lazy var avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.backgroundColor = .gray
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: Fonts().gilroyBold, size: LocaleConstants.nameFontSize)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = UIFont(name: Fonts().gilroyMedium, size: LocaleConstants.statusFontSize)
        statusLabel.textAlignment = .center
        statusLabel.textColor = Colors().green
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Colors().background
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(avatarImage)
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: self.topAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: LocaleConstants.avatarImageConstant),
            avatarImage.heightAnchor.constraint(equalToConstant: LocaleConstants.avatarImageConstant),
            avatarImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: LocaleConstants.anchorConstantName),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: LocaleConstants.anchorConstantStatus),
            statusLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    func setup(character: Character) {
        avatarImage.loadImage(from: character.image)
        nameLabel.text = character.name
        statusLabel.text = character.status
    }
    
    override func layoutSubviews() {
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = LocaleConstants.avatarImageCornerRadius
        
        if statusLabel.text == "Alive" {
            statusLabel.textColor = Colors().green
        } else if statusLabel.text == "Dead" {
            statusLabel.textColor = .red
        } else {
            statusLabel.textColor = Colors().lightGrayText
        }
    }
    
}

private extension HeaderCell {
    
    enum LocaleConstants {
        static let avatarImageCornerRadius: CGFloat = 10
        static let nameFontSize: CGFloat = 22
        static let statusFontSize: CGFloat = 16
        
        static let avatarImageConstant: CGFloat = 148
        static let anchorConstantName: CGFloat = 24
        static let anchorConstantStatus: CGFloat = 8
    }
    
}
