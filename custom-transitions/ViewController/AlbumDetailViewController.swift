//
//  AlbumDetailViewController.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 4/4/21.
//

import UIKit

final class AlbumDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let album: Album
    public var headerView: AlbumDetailHeaderView?
    
    // MARK: - Initializer
    
    init(album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let headerView = headerView else { return }
        UIView.animate(withDuration: 0.6) {
            [headerView.closeButton, headerView.albumTitleLabel].forEach {
                $0.alpha = 1
            }
        }
    }
}

// MARK: - Setups

private extension AlbumDetailViewController {
    func setupUI() {
        setupBackgroundColor()
        setupHeaderView()
        setupCollectionView()
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = .albumBackgroundColor
    }
    
    func setupHeaderView() {
        let headerView = AlbumDetailHeaderView(albumCoverImageName: album.coverImage, albumTitle: album.name, delegate: self)
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        
        [headerView.closeButton, headerView.albumTitleLabel].forEach {
            $0.alpha = 0
        }
        self.headerView = headerView
    }
    
    func setupCollectionView() {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.itemSize = .init(width: view.bounds.size.width - 60, height: 50)
        collectionLayout.sectionInset.top = 5
        
        let songsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        view.addSubview(songsCollectionView)
        songsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        songsCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        songsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        songsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        songsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        songsCollectionView.backgroundColor = .clear
        songsCollectionView.register(AlbumDetailCollectionCell.self, forCellWithReuseIdentifier: AlbumDetailCollectionCell.reuseIdentifier)
        songsCollectionView.dataSource = self
        songsCollectionView.delegate = self
        
        UIView.transition(with: songsCollectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            songsCollectionView.reloadData()
        }, completion: nil)
    }
}

// MARK: - UICollectionView DataSource

extension AlbumDetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumDetailCollectionCell.reuseIdentifier, for: indexPath) as? AlbumDetailCollectionCell else {
            fatalError("Invalid reusable cell")
        }
        let row = indexPath.row
        let song = album.songs[row]
        let songTitle = "\(row + 1) - \(song.name)"
        cell.configure(withTitle: songTitle)
        return cell
    }
}

// MARK: - UICollectionView Delegate

extension AlbumDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - HeaderView Delegate

extension AlbumDetailViewController: AlbumDetailHeaderViewDelegate {
    func closeButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
