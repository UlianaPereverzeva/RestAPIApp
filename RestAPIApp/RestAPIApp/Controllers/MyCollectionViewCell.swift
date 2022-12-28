//
//  MyCollectionViewCell.swift
//  RestAPIApp
//
//  Created by ульяна on 27.12.22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
     var titleLabel: UILabel?
    
    func configure(title: String, backgroundColor: UIColor) {
        if titleLabel == nil {
            self.addTitleLabel()
        }
        
        titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .black)
        titleLabel?.textColor = .systemPink
        titleLabel?.text = title
        self.contentView.backgroundColor = backgroundColor
    }
    
    private func addTitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleLabel = label
        
        self.contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    private func configureUI() {
        
    }
}
