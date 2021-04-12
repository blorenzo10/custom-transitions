//
//  AlbumDetailHeaderView.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 4/4/21.
//

import UIKit

protocol AlbumDetailHeaderViewDelegate: class {
    func closeButtonDidTap()
}

final class AlbumDetailHeaderView: UIView {
    
    // MARK: - Subviews
    
    public lazy var closeButton = UIButton.closeButton()
    public lazy var albumCoverImageView = UIImageView()
    public lazy var albumTitleLabel = UILabel.albumDetailLabel(type: .title)
    
    // MARK: - Properties
    
    let albumCoverImageName: String
    let albumTitle: String
    weak var delegate: AlbumDetailHeaderViewDelegate?
    
    // MARK: - Initializer
    
    init(frame: CGRect = .zero, albumCoverImageName: String, albumTitle: String, delegate: AlbumDetailHeaderViewDelegate? = nil) {
        self.albumCoverImageName = albumCoverImageName
        self.albumTitle = albumTitle
        self.delegate = delegate
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups

private extension AlbumDetailHeaderView {
    func setupUI() {
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        closeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        
        addSubview(albumCoverImageView)
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        albumCoverImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        albumCoverImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        albumCoverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        albumCoverImageView.image = UIImage(named: albumCoverImageName)
        
        addSubview(albumTitleLabel)
        albumTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        albumTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        albumTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        albumTitleLabel.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 25).isActive = true
        albumTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        albumTitleLabel.text = albumTitle
    }
}

// MARK: - Actions

private extension AlbumDetailHeaderView {
    @objc
    func closeButtonDidTap() {
        delegate?.closeButtonDidTap()
    }
}
