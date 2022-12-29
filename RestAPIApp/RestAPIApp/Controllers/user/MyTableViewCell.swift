//
//  MyTableViewCell.swift
//  RestAPIApp
//
//  Created by ульяна on 28.12.22.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    private var title = UILabel()
    private var subtitle = UILabel()
    private var defaultImage = UIImageView()
    private var didSetUpUI = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isHighlighted = false
        // Initialization code
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        // Configure the view for the selected state
//    }
    
    
    
    func configure(name: String, surname: String) {
        if !self.didSetUpUI {
            self.setUpImage()
            self.setUpTitleAndSubtitle()
            self.didSetUpUI = true
        }
        
        self.title.text = name
        self.subtitle.text = surname
        

    }
    
    func setUpImage() {
        self.defaultImage.translatesAutoresizingMaskIntoConstraints = false
        let defaultPerson = UIImage(named: "defaultPerson")
        self.defaultImage.contentMode = .scaleAspectFit
        self.defaultImage.image = defaultPerson
        self.contentView.addSubview(self.defaultImage)
        
        NSLayoutConstraint.activate([
            self.defaultImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            self.defaultImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            self.defaultImage.widthAnchor.constraint(equalToConstant: 50),
            self.defaultImage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUpTitleAndSubtitle() {
        self.title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        self.title.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.title.textAlignment = .left
        self.subtitle.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.subtitle.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.subtitle.textAlignment = .left
        
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(self.title)
        self.contentView.addSubview(self.subtitle)
        
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            self.title.leadingAnchor.constraint(equalTo: self.defaultImage.trailingAnchor, constant: 14),
            self.title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            self.title.heightAnchor.constraint(equalToConstant: 24),
            
            self.subtitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 6),
            self.subtitle.leadingAnchor.constraint(equalTo: self.defaultImage.trailingAnchor, constant: 14),
            self.subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            self.subtitle.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
