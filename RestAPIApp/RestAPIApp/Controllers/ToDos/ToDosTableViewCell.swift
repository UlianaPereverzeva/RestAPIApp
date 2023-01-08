//
//  ToDosTableViewCell.swift
//  RestAPIApp
//
//  Created by ульяна on 8.01.23.
//

import UIKit

class ToDosTableViewCell: UITableViewCell {
    
    var title = UILabel()
    var taskIsReady = UILabel()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected == true{
            self.contentView.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.70, alpha: 1.00)
        } else if selected == false {
            self.contentView.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
        }
    }
    
    func configureToDosCell(title: String, completed: String) {
        
        self.title.text = title
        self.title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.title.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.title.textAlignment = .left
        self.title.numberOfLines = 0
        self.title.text = title
        
        self.taskIsReady.text = completed
        self.taskIsReady.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.taskIsReady.textColor = UIColor(red: 0.37, green: 0.78, blue: 0.37, alpha: 1.00)
        self.taskIsReady.textAlignment = .left
        self.taskIsReady.numberOfLines = 1
        self.taskIsReady.text = completed
        
        self.contentView.addSubview(self.title)
        self.contentView.addSubview(self.taskIsReady)
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.taskIsReady.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 14),
            self.title.trailingAnchor.constraint(equalTo: self.taskIsReady.leadingAnchor, constant: -20),
            self.title.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 14),
            self.title.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -14),
            self.title.widthAnchor.constraint(equalToConstant: 250),
            
            self.taskIsReady.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 14),
            self.taskIsReady.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
            self.taskIsReady.leadingAnchor.constraint(equalTo: self.title.trailingAnchor, constant: 20),
            self.taskIsReady.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -14),
            self.taskIsReady.widthAnchor.constraint(equalToConstant: 170)
        ])
        
    }
}
