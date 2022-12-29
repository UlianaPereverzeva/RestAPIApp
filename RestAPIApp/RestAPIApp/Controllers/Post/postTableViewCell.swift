//
//  postTableViewCell.swift
//  RestAPIApp
//
//  Created by ульяна on 29.12.22.
//

import UIKit

class postTableViewCell: UITableViewCell {

    private var title = UILabel()
    private var text = UILabel()
    private var didSetUpUI = false

    
    func configure(title: String, text: String) {
        if !self.didSetUpUI {
            self.setUpUI()
            self.didSetUpUI = true
        }
        
        self.title.text = title
        self.text.text = text
        
    }
    
    func setUpUI() {
        self.title.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        self.title.textAlignment = .left
        self.text.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.text.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        self.text.textAlignment = .left
        
        self.contentView.addSubview(self.title)
        self.contentView.addSubview(self.text)

        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 14),
            self.title.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 14),
            self.title.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 4),
            self.title.heightAnchor.constraint(equalToConstant: 24),
            
            self.text.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 4),
            self.text.leadingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 14),
            self.text.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 4),
            self.text.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 14),
            self.text.heightAnchor.constraint(equalToConstant: 20)
        ])

    }

}
