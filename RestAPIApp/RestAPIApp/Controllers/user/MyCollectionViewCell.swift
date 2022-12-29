//
//  MyCollectionViewCell.swift
//  RestAPIApp
//
//  Created by ульяна on 27.12.22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    private var titleLabel: UILabel?
    
    func configure(title: String, backgroundColor: UIColor) {
        if titleLabel == nil {
            self.addTitleLabel()
        }
        
        titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .black)
        titleLabel?.textColor = UIColor(red: 0.76, green: 0.88, blue: 0.77, alpha: 1.00)
        titleLabel?.text = title
        self.contentView.backgroundColor = backgroundColor
        self.contentView.layer.cornerRadius = 20

        
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
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
