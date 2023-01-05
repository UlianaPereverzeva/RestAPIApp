//
//  DetailPhotoViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 5.01.23.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class DetailPhotoViewController: UIViewController {

    var image = UIImageView()
    var activityIndicator: UIActivityIndicatorView!
    var photo: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhoto()
        setUpImage()
        setUpActivityIndecator()
        
        self.view.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
        navigationItem.title = photo?["title"].string
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
    }
    
    func setUpActivityIndecator() {
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator?.center = self.image.center
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.image.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.image.centerYAnchor)
        ])
    }

    func setUpImage() {
        self.image.translatesAutoresizingMaskIntoConstraints = false
        let photo = UIImage(named: "defaultImage")
        self.image.image = photo
        image.contentMode = .scaleAspectFit
        self.view.addSubview(image)
        
        NSLayoutConstraint.activate([
            self.image.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            self.image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            self.image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    func getPhoto(){
        guard let photo = photo,
              let imageURL = photo["url"].string else { return }
 
        NetworkService.getPhoto(imageURL: imageURL) { [weak self] image, error in
            self?.activityIndicator.stopAnimating()
            self?.image.image = image
        }
    }
}
