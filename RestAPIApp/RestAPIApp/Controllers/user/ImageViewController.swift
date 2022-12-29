//
//  ImageViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 28.12.22.
//

import UIKit

class ImageViewController: UIViewController {
    
    var defaultImage = UIImageView()
    var activityIndicator: UIActivityIndicatorView!
    
    
    
    private let imageURLString = "https://media.cntraveler.com/photos/5eb18e42fc043ed5d9779733/master/pass/BlackForest-Germany-GettyImages-147180370.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.76, green: 0.88, blue: 0.77, alpha: 1.00)
        
        fetchImage ()
        setUpImage()
        setUpActivityIndicator()
    }
    
    private func fetchImage (){
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: imageURLString)!)) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.activityIndicator?.stopAnimating()
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if let response = response{
                    print(response)
                }
                
                if let data = data,
                   let image = UIImage(data: data) {
                    self?.defaultImage.image = image
                }
            }
        }
        task.resume()
        
    }
    
    private func setUpImage() {
        
        let forestImage = UIImage(named: "defaultImage")
        defaultImage.contentMode = UIView.ContentMode.scaleAspectFit
        defaultImage.frame.size.width = 350
        defaultImage.frame.size.height = 350
        defaultImage.center = self.view.center
        defaultImage.image = forestImage
        view.addSubview(defaultImage)
        
    }
    
    private func setUpActivityIndicator() {
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = self.defaultImage.center
        self.view.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
        
    }
    
}
