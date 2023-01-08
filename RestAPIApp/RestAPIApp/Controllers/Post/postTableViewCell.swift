//
//  postTableViewCell.swift
//  RestAPIApp
//
//  Created by ульяна on 29.12.22.
//

import UIKit

class postTableViewCell: UITableViewCell {

    var title = UILabel()
    var text = UILabel()
    private var editButton: UIButton!
    private var didSetUpUI = false
    var editButtonAction: () -> ()  = { }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true{
            self.contentView.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.70, alpha: 1.00)
            } else if selected == false {
                self.contentView.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
            }
    }
    
    
    func configure(title: String, text: String) {
        if !self.didSetUpUI {
            self.setUpUI()
            self.didSetUpUI = true
        }
        
        self.title.text = title
        self.text.text = text
        self.backgroundColor = .clear
    }
    
    func setUpUI() {
        
        self.title.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        self.title.textAlignment = .left
        self.title.numberOfLines = 0
        self.text.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.text.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        self.text.textAlignment = .left
        self.text.numberOfLines = 0
        
        let edit = UIButton(type: .system)
        edit.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        edit.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        let attributedString = NSAttributedString(string: NSLocalizedString("Edit", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium),
            NSAttributedString.Key.foregroundColor : UIColor(red: 0.45, green: 0.19, blue: 0.44, alpha: 1.00),
            NSAttributedString.Key.underlineStyle:1.0
        ])
        edit.setAttributedTitle(attributedString, for: .normal)
        self.editButton = edit

        self.contentView.addSubview(editButton)
        self.contentView.addSubview(self.title)
        self.contentView.addSubview(self.text)

        self.editButton.translatesAutoresizingMaskIntoConstraints = false
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.text.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 14),
            self.title.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 14),
            self.title.widthAnchor.constraint(equalToConstant: 300),
            
            self.text.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 4),
            self.text.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 14),
            self.text.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -14),
            self.text.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -14),
            
            self.editButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.editButton.leadingAnchor.constraint(equalTo: self.title.trailingAnchor, constant: 10),
            self.editButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),

            self.editButton.widthAnchor.constraint(equalToConstant: 40)

        ])

    }
    @objc func didTapButton(_ sender:UIButton!) {
        editButtonAction()
        }
//    @objc func editButtonAction(_ sender:UIButton!) {
//        let vc = CreatingPostViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }

}
