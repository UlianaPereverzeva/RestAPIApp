//
//  AlbomTableViewCell.swift
//  RestAPIApp
//
//  Created by ульяна on 4.01.23.
//

import UIKit

class AlbomTableViewCell: UITableViewCell {

    private var title = UILabel()
    private var text = UILabel()
    private var didSelectUi = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(titleOfAlbom: String, textOfAlbom: String){
        if !self.didSelectUi {
            setUpUi()
            didSelectUi = true
        }
        
        self.title.text = titleOfAlbom
        self.text.text = textOfAlbom
        self.backgroundColor = .clear

    }
    
    func setUpUi(){
        
        self.title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        self.title.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.title.textAlignment = .left
        self.title.numberOfLines = 0
        
        self.text.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        self.text.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.text.textAlignment = .left
        self.text.numberOfLines = 0
        
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.text.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(title)
        self.contentView.addSubview(text)
        
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 14),
            self.title.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 14),
            self.title.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
            
            self.text.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 4),
            self.text.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 14),
            self.text.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
            self.text.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -14),
        ])


    }
    
}
