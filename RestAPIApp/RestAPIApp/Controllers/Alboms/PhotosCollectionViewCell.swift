//
//  PhotosCollectionViewCell.swift
//  RestAPIApp
//
//  Created by ульяна on 4.01.23.
//

import UIKit
import Alamofire
import AlamofireImage

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var image = UIImageView()
    var activityIndicator: UIActivityIndicatorView!
    var didSelectImage = false
    var thumbnailUrl: String? {
        didSet {
            getThumbnail()
            configure()
        }
    }
    
    func configure(){
        
        if !self.didSelectImage {
            setUpImage()
            didSelectImage = true
        }
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator?.center = self.image.center
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    func setUpImage(){
        self.image.translatesAutoresizingMaskIntoConstraints = false
        self.image.contentMode = .scaleAspectFit
        let defaultImage = UIImage(named: "defaultImage")
        self.image.image = defaultImage
        self.contentView.addSubview(self.image)
        self.contentView.backgroundColor = UIColor(red: 0.76, green: 0.88, blue: 0.77, alpha: 1.00)
        self.contentView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            self.image.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func getThumbnail() {
        guard let thumbnailUrl = thumbnailUrl else { return }
        AF.request(thumbnailUrl).responseImage { [weak self] response in
            debugPrint(response)

            print(response.request)
            print(response.response)
            debugPrint(response.result)

            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
                
                self?.activityIndicator.stopAnimating()
                self?.image.image = image
            }
        }
    }
}
