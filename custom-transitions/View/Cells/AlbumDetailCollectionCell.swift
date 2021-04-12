//
//  AlbumDetailCollectionCell.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 5/4/21.
//

import UIKit

final class AlbumDetailCollectionCell: UICollectionViewCell, ReusableView {
    
    // MARK: - Subviews
    
    private lazy var songTitleLabel = UILabel.albumDetailLabel(type: .song)
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups

private extension AlbumDetailCollectionCell {
    func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .songBackgroundColor
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 12
        
        clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: 0, height: 3)
        layer.shadowRadius = 4
        
        contentView.addSubview(songTitleLabel)
        songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        songTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        songTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
    }
}

// MARK: - Public

extension AlbumDetailCollectionCell {
    func configure(withTitle title: String) {
        songTitleLabel.text = title
    }
}
