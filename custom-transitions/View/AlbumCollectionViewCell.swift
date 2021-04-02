//
//  AlbumCollectionViewCell.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 1/4/21.
//

import UIKit

final class AlbumCollectionViewCell: UICollectionViewCell, ReusableView {
    
    // MARK: - Subviews
    
    private lazy var albumCoverImageView = UIImageView()
    private lazy var albumNameLabel = UILabel.albumCoverLabel(type: .title)
    private lazy var albumReleaseYearLabel = UILabel.albumCoverLabel(type: .subtitle)
    private lazy var songsQuantityLabel = UILabel.albumCoverLabel(type: .regular)
 
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: - Setup

private extension AlbumCollectionViewCell {
    func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        let gradient = CAGradientLayer()
        gradient.frame = contentView.bounds
        gradient.colors = [UIColor.backgroundColorGradient1 ?? .black, UIColor.backgroundColorGradient2 ?? .black].map { $0.cgColor }
        gradient.startPoint = .init(x: 0.5, y: 0)
        gradient.endPoint = .init(x: 0.5, y: 1)
        gradient.locations = [0.5]
        contentView.layer.insertSublayer(gradient, at: 0)
            
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 24
        
        clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: 0, height: 3)
        layer.shadowRadius = 4
        
        contentView.addSubview(albumCoverImageView)
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        albumCoverImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        albumCoverImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        albumCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35).isActive = true
        albumCoverImageView.clipsToBounds = true
        albumCoverImageView.layer.cornerRadius = 100
        albumCoverImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(albumNameLabel)
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 25).isActive = true
        albumNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        albumNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentView.addSubview(albumReleaseYearLabel)
        albumReleaseYearLabel.translatesAutoresizingMaskIntoConstraints = false
        albumReleaseYearLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 16).isActive = true
        albumReleaseYearLabel.leftAnchor.constraint(equalTo: albumNameLabel.leftAnchor).isActive = true
        albumReleaseYearLabel.rightAnchor.constraint(equalTo: albumNameLabel.rightAnchor).isActive = true
        albumReleaseYearLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(songsQuantityLabel)
        songsQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
        songsQuantityLabel.topAnchor.constraint(equalTo: albumReleaseYearLabel.bottomAnchor, constant: 16).isActive = true
        songsQuantityLabel.leftAnchor.constraint(equalTo: albumReleaseYearLabel.leftAnchor).isActive = true
        songsQuantityLabel.rightAnchor.constraint(equalTo: albumReleaseYearLabel.rightAnchor).isActive = true
    }
}

// MARK: - Public

extension AlbumCollectionViewCell {
    public func configure(with album: Album) {
        albumCoverImageView.image = UIImage(named: album.coverImage)
        albumNameLabel.text = album.name
        albumReleaseYearLabel.text = "\(album.releaseYear)"
        songsQuantityLabel.text = "\(album.songs.count) songs"
    }
}
