//
//  EpisodesCell.swift
//  Rick&MortyApp
//
//  Created by Arina on 19.08.2023.
//

import UIKit

class EpisodesCell: UITableViewCell {
    
    private lazy var backroundV: UIView = {
        let backroundV = UIView()
        backroundV.backgroundColor = Colors().cards
        backroundV.layer.cornerRadius = LocaleConstants.cornerRadius
        backroundV.translatesAutoresizingMaskIntoConstraints = false
        return backroundV
    }()
    
    private lazy var episodeNameLabel: UILabel = {
        let episodeNameLabel = UILabel()
        episodeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeNameLabel.font = UIFont(name: Fonts().gilroySemiBold, size: LocaleConstants.episodeNameFontSize)
        episodeNameLabel.textColor = .white
        return episodeNameLabel
    }()
    
    private lazy var episodeNumberLabel: UILabel = {
        let episodeNumberLabel = UILabel()
        episodeNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeNumberLabel.font = UIFont(name: Fonts().gilroyMedium, size: LocaleConstants.episodeNumberFontSize)
        episodeNumberLabel.textColor = Colors().green
        return episodeNumberLabel
    }()
    
    private lazy var episodeDateLabel: UILabel = {
        let episodeDateLabel = UILabel()
        episodeDateLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeDateLabel.font = UIFont(name: Fonts().gilroyMedium, size: LocaleConstants.episodeDateFontSize)
        episodeDateLabel.textColor = Colors().grayDateText
        episodeDateLabel.textAlignment = .right
        return episodeDateLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        self.backgroundColor = Colors().background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(backroundV)
        backroundV.addSubview(episodeNameLabel)
        backroundV.addSubview(episodeNumberLabel)
        backroundV.addSubview(episodeDateLabel)
        
        NSLayoutConstraint.activate ([
            backroundV.topAnchor.constraint(equalTo: self.topAnchor),
            backroundV.leftAnchor.constraint(equalTo: self.leftAnchor),
            backroundV.rightAnchor.constraint(equalTo: self.rightAnchor),
            backroundV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: LocaleConstants.anchorConstantBottom),
            
            episodeNameLabel.topAnchor.constraint(equalTo: backroundV.topAnchor, constant: LocaleConstants.anchorConstant),
            episodeNameLabel.leftAnchor.constraint(equalTo: backroundV.leftAnchor, constant: LocaleConstants.anchorConstant),
            episodeNameLabel.rightAnchor.constraint(equalTo: backroundV.rightAnchor, constant: -LocaleConstants.anchorConstant),
            
            episodeNumberLabel.bottomAnchor.constraint(equalTo: backroundV.bottomAnchor, constant: LocaleConstants.anchorConstantBottom),
            episodeNumberLabel.leftAnchor.constraint(equalTo: backroundV.leftAnchor, constant: LocaleConstants.anchorConstant),
            
            episodeDateLabel.bottomAnchor.constraint(equalTo: backroundV.bottomAnchor, constant: -LocaleConstants.anchorConstant),
            episodeDateLabel.rightAnchor.constraint(equalTo: backroundV.rightAnchor, constant: -LocaleConstants.anchorConstant),
        ])
    }
    
    func setup(episode: Episode) {
        episodeNameLabel.text = episode.name
        episodeDateLabel.text = episode.air_date
        episodeNumberLabel.text = convertToEpisodeString(input: episode.episode)
    }
    
    func convertToEpisodeString(input: String) -> String {
        let components = input.components(separatedBy: "E")
        
        guard let season = components.first?.replacingOccurrences(of: "S", with: ""),
              let episode = components.last else {
            return input
        }
        
        let episodeString = "Episode: \(episode), Season: \(season)"
        return episodeString
    }
}

private extension EpisodesCell {
    
    enum LocaleConstants {
        static let cornerRadius: CGFloat = 16
        static let episodeNameFontSize: CGFloat = 17
        static let episodeNumberFontSize: CGFloat = 13
        static let episodeDateFontSize: CGFloat = 12
        static let anchorConstant: CGFloat = 16
        static let anchorConstantBottom: CGFloat = -14
    }
    
}
