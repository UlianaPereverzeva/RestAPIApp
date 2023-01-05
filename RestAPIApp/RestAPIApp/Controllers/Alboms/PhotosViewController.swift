//
//  PhotosViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 4.01.23.
//

import UIKit
import SwiftyJSON

class PhotosCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var user: User?
    var albom: JSON?
    var photos:[JSON] = []
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        configureCollectionView()
        
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.view.backgroundColor = UIColor(red: 0.76, green: 0.88, blue: 0.77, alpha: 1.00)
        navigationItem.title = albom?["title"].string
        
    }
    
    private func configureCollectionView() {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        self.collectionView = collectionView
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell()
        }
        let thumbnailUrl = photos[indexPath.row]["thumbnailUrl"].string
        cell.thumbnailUrl = thumbnailUrl
        return cell
    }
    
    private func getData() {
        guard let albom = albom,
              let albomId = albom["id"].int else { return }
        NetworkService.fetchPhotos(albomID: albomId) { [weak self] result, error in
            guard let photos = result else { return }
            self?.photos = photos
            self?.collectionView?.reloadData()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         CGSize(width: (collectionView.bounds.width / 2) - 15 , height: (collectionView.bounds.width / 2) - 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailPhotoViewController()
        let photo = photos[indexPath.row]
        vc.photo = photo
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
