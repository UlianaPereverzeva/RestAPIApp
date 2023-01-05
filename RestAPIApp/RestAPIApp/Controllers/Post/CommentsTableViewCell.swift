//
//  CommentsTableViewCell.swift
//  RestAPIApp
//
//  Created by ульяна on 3.01.23.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    private var name = UILabel()
    private var text = UILabel()
    private var didSetUpUI = false


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true{
            self.contentView.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.70, alpha: 1.00)
            } else if selected == false {
                self.contentView.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
            }
    }
    
    func configure(title: String, comment: String) {
        if !self.didSetUpUI {
        setUpUI()
            didSetUpUI = true
        }
        
        self.name.text = title
        self.text.text = comment
        self.backgroundColor = .clear

    }
    
    func setUpUI() {
        self.name.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        self.name.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.name.textAlignment = .left
        
        self.text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.text.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.text.textAlignment = .left
        
        self.name.translatesAutoresizingMaskIntoConstraints = false
        self.text.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(self.name)
        self.contentView.addSubview(self.text)
        
        NSLayoutConstraint.activate([
            self.name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            self.name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            self.name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            
            self.text.topAnchor.constraint(equalTo: self.name.bottomAnchor, constant: 4),
            self.text.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            self.text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            self.text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),

        ])


    }

}
