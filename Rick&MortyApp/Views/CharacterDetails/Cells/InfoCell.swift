//
//  InfoCell.swift
//  Rick&MortyApp
//
//  Created by Arina on 19.08.2023.
//

import UIKit

class InfoCell: UITableViewCell {
    
    private lazy var backroundV: UIView = {
        let backroundV = UIView()
        backroundV.backgroundColor = Colors().cards
        backroundV.translatesAutoresizingMaskIntoConstraints = false
        return backroundV
    }()
    
    private lazy var speciesLabel: UILabel = {
        let speciesLabel = UILabel()
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.font = UIFont(name: Fonts().gilroyMedium, size: LocaleConstants.fontSize)
        speciesLabel.textColor = Colors().lightGrayText
        speciesLabel.text = Texts().infoCellSpecies
        return speciesLabel
    }()
    
    private lazy var speciesLeftLabel: UILabel = {
        let speciesLeftLabel = UILabel()
        speciesLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLeftLabel.font = UIFont(name: Fonts().gilroyMedium, size: LocaleConstants.fontSize)
        speciesLeftLabel.textColor = .white
        return speciesLeftLabel
    }()
    
    private lazy var typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont(name: Fonts().gilroyMedium, size: LocaleConstants.fontSize)
        typeLabel.textColor = Colors().lightGrayText
        typeLabel.text = Texts().infoCellType
        return typeLabel
    }()
    
    private lazy var typeLeftLabel: UILabel = {
        let typeLeftLabel = UILabel()
        typeLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLeftLabel.font = UIFont(name: Fonts().gilroyMedium, size: LocaleConstants.fontSize)
        typeLeftLabel.textColor = .white
        return typeLeftLabel
    }()
    
    private lazy var genderLabel: UILabel = {
        let genderLabel = UILabel()
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.font = UIFont(name: Fonts().gilroyMedium, size: LocaleConstants.fontSize)
        genderLabel.textColor = Colors().lightGrayText
        genderLabel.text = Texts().infoCellGender
        return genderLabel
    }()
    
    private lazy var genderLeftLabel: UILabel = {
        let genderLeftLabel = UILabel()
        genderLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLeftLabel.font = UIFont(name: Fonts().gilroyMedium, size: LocaleConstants.fontSize)
        genderLeftLabel.textColor = .white
        return genderLeftLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Colors().background
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backroundV.layer.cornerRadius = LocaleConstants.cornerRadius
    }
    
    private func setupView() {
        self.addSubview(backroundV)
        backroundV.addSubview(speciesLabel)
        backroundV.addSubview(typeLabel)
        backroundV.addSubview(genderLabel)
        backroundV.addSubview(speciesLeftLabel)
        backroundV.addSubview(typeLeftLabel)
        backroundV.addSubview(genderLeftLabel)
        
        NSLayoutConstraint.activate ([
            backroundV.topAnchor.constraint(equalTo: self.topAnchor),
            backroundV.leftAnchor.constraint(equalTo: self.leftAnchor),
            backroundV.rightAnchor.constraint(equalTo: self.rightAnchor),
            backroundV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -LocaleConstants.anchorConstantBottom),
            
            speciesLabel.topAnchor.constraint(equalTo: backroundV.topAnchor, constant: LocaleConstants.anchorConstant),
            speciesLabel.leftAnchor.constraint(equalTo: backroundV.leftAnchor, constant: LocaleConstants.anchorConstant),
            
            typeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: LocaleConstants.anchorConstant),
            typeLabel.leftAnchor.constraint(equalTo: backroundV.leftAnchor, constant: LocaleConstants.anchorConstant),
            
            genderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: LocaleConstants.anchorConstant),
            genderLabel.leftAnchor.constraint(equalTo: backroundV.leftAnchor, constant: LocaleConstants.anchorConstant),
            
            speciesLeftLabel.topAnchor.constraint(equalTo: backroundV.topAnchor, constant: LocaleConstants.anchorConstant),
            speciesLeftLabel.rightAnchor.constraint(equalTo: backroundV.rightAnchor, constant: -LocaleConstants.anchorConstant),
            
            typeLeftLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: LocaleConstants.anchorConstant),
            typeLeftLabel.rightAnchor.constraint(equalTo: backroundV.rightAnchor, constant: -LocaleConstants.anchorConstant),
            
            genderLeftLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: LocaleConstants.anchorConstant),
            genderLeftLabel.rightAnchor.constraint(equalTo: backroundV.rightAnchor, constant: -LocaleConstants.anchorConstant),
        ])
    }
    
    func setup(character: Character) {
        genderLeftLabel.text = character.gender
        speciesLeftLabel.text = character.species
        typeLeftLabel.text = character.type
        
        if genderLeftLabel.text == "" {
            genderLeftLabel.text = "None"
        }
        
        if speciesLeftLabel.text == "" {
            speciesLeftLabel.text = "None"
        }
        
        if typeLeftLabel.text == "" {
            typeLeftLabel.text = "None"
        }
    }
}

private extension InfoCell {
    
    enum LocaleConstants {
        static let cornerRadius: CGFloat = 16
        static let fontSize: CGFloat = 16
        static let anchorConstant: CGFloat = 16
        static let anchorConstantBottom: CGFloat = 8
    }
    
}
