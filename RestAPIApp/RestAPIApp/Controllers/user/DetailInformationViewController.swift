//
//  DetailInformationViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 28.12.22.
//

import UIKit

class DetailInformationViewController: UIViewController {
    var user: User?
    
    
    var name = UILabel()
    var nameLabel = UILabel()
    var username = UILabel()
    var usernameLabel = UILabel()
    var email = UILabel()
    var emailLabel = UILabel()
    var phone = UILabel()
    var phoneLabel = UILabel()
    var website = UILabel()
    var websiteLabel = UILabel()
    var defaultImage = UIImageView()
    var addressLabel = UILabel()
    let scrollView = UIScrollView()
    let contentview = UIView()

    var address: UIButton!
    var postButton: UIButton!
    var albomButton: UIButton!
    var toDos: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setUpUI()
        setUpStackView()
       
        view.backgroundColor = UIColor(red: 0.76, green: 0.88, blue: 0.77, alpha: 1.00)

        // Do any additional setup after loading the view.
    }
    

    func setupScrollView(){
        
//        let scrollContentGuide = scrollView.contentLayoutGuide
//        let scrollFrameGuide = scrollView.frameLayoutGuide
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentview)
        
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        
        
        contentview.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentview.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentview.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentview.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        }
    
    
    func setUpUI() {
        
        let pbutton = UIButton(type: .system)
        pbutton.setTitle("Post", for: .normal)
        pbutton.addTarget(self, action: #selector(postButtonAction(_:)), for: .touchUpInside)
        pbutton.setTitleColor(UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00), for: .normal)
        pbutton.backgroundColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        pbutton.layer.cornerRadius = 30
        pbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.postButton = pbutton
        self.contentview.addSubview(postButton)
        self.postButton.translatesAutoresizingMaskIntoConstraints = false

        postButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        let abutton = UIButton(type: .system)
        abutton.setTitle("Albom", for: .normal)
        abutton.addTarget(self, action: #selector(albomButtonAction(_:)), for: .touchUpInside)
        abutton.setTitleColor(UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00), for: .normal)
        abutton.backgroundColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        abutton.layer.cornerRadius = 30
        abutton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.albomButton = abutton
        self.contentview.addSubview(albomButton)
        self.albomButton.translatesAutoresizingMaskIntoConstraints = false

        albomButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        let tdbutton = UIButton(type: .system)
        tdbutton.setTitle("ToDo-s", for: .normal)
        tdbutton.addTarget(self, action: #selector(toDosButtonAction(_:)), for: .touchUpInside)
        tdbutton.setTitleColor(UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00), for: .normal)
        tdbutton.backgroundColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        tdbutton.layer.cornerRadius = 30
        tdbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.toDos = tdbutton
        self.contentview.addSubview(toDos)
        self.toDos.translatesAutoresizingMaskIntoConstraints = false

        toDos.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        let addressbutton = UIButton(type: .system)
        addressbutton.addTarget(self, action: #selector(addressbuttonAction(_:)), for: .touchUpInside)
        addressbutton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        let attributedString = NSAttributedString(string: NSLocalizedString(user?.company?.name ?? "", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor(red: 0.45, green: 0.19, blue: 0.44, alpha: 1.00),
            NSAttributedString.Key.underlineStyle:1.0
        ])
        addressbutton.setAttributedTitle(attributedString, for: .normal)


        self.address = addressbutton
        self.contentview.addSubview(address)
        self.address.translatesAutoresizingMaskIntoConstraints = false

        address.heightAnchor.constraint(equalToConstant: 20).isActive = true

        
        self.defaultImage.translatesAutoresizingMaskIntoConstraints = false
        let imageView = UIImage(named: "defaultPerson")
        defaultImage.contentMode = .scaleAspectFit
        defaultImage.image = imageView
        
        self.name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.name.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.name.textAlignment = .left
        self.name.text = user?.name
        self.nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.nameLabel.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.nameLabel.textAlignment = .left
        self.nameLabel.text = "Name:"
        self.username.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.username.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.username.textAlignment = .left
        self.username.text = user?.username
        self.usernameLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.usernameLabel.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.usernameLabel.textAlignment = .left
        self.usernameLabel.text = "Username"
        self.email.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.email.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.email.textAlignment = .left
        self.email.text = user?.email
        self.emailLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.emailLabel.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.emailLabel.textAlignment = .left
        self.emailLabel.text = "Email:"
        self.phone.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.phone.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.phone.textAlignment = .left
        self.phone.text = user?.phone
        self.phoneLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.phoneLabel.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.phoneLabel.textAlignment = .left
        self.phoneLabel.text = "Phone:"
        self.website.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.website.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.website.textAlignment = .left
        self.website.text = user?.website
        self.websiteLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.websiteLabel.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.websiteLabel.textAlignment = .left
        self.websiteLabel.text = "Website:"
        self.addressLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.addressLabel.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.addressLabel.textAlignment = .left
        self.addressLabel.text = "Company address:"
        
        self.name.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.username.translatesAutoresizingMaskIntoConstraints = false
        self.usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.email.translatesAutoresizingMaskIntoConstraints = false
        self.emailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.phone.translatesAutoresizingMaskIntoConstraints = false
        self.phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        self.website.translatesAutoresizingMaskIntoConstraints = false
        self.websiteLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addressLabel.translatesAutoresizingMaskIntoConstraints = false

//
    }
    
    func setUpStackView() {
        let nameStackView = UIStackView()
        nameStackView.axis = NSLayoutConstraint.Axis.horizontal
        nameStackView.distribution  = UIStackView.Distribution.equalSpacing
        nameStackView.alignment = UIStackView.Alignment.center
        nameStackView.spacing = 20.0

        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(name)
        nameStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentview.addSubview(nameStackView)

        //Constraints
        nameStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nameStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let userNameStackView = UIStackView()
        userNameStackView.axis = NSLayoutConstraint.Axis.horizontal
        userNameStackView.distribution  = UIStackView.Distribution.equalSpacing
        userNameStackView.alignment = UIStackView.Alignment.center
        userNameStackView.spacing = 20.0

        userNameStackView.addArrangedSubview(usernameLabel)
        userNameStackView.addArrangedSubview(username)
        userNameStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentview.addSubview(userNameStackView)

        //Constraints
        userNameStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        userNameStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let emailStackView = UIStackView()
        emailStackView.axis = NSLayoutConstraint.Axis.horizontal
        emailStackView.distribution  = UIStackView.Distribution.equalSpacing
        emailStackView.alignment = UIStackView.Alignment.center
        emailStackView.spacing = 20.0

        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(email)
        emailStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentview.addSubview(emailStackView)

        //Constraints
        emailStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        emailStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let phoneStackView = UIStackView()
        phoneStackView.axis = NSLayoutConstraint.Axis.horizontal
        phoneStackView.distribution  = UIStackView.Distribution.equalSpacing
        phoneStackView.alignment = UIStackView.Alignment.center
        phoneStackView.spacing = 20.0

        phoneStackView.addArrangedSubview(phoneLabel)
        phoneStackView.addArrangedSubview(phone)
        phoneStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentview.addSubview(phoneStackView)

        //Constraints
        phoneStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        phoneStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let websiteStackView = UIStackView()
        websiteStackView.axis = NSLayoutConstraint.Axis.horizontal
        websiteStackView.distribution  = UIStackView.Distribution.equalSpacing
        websiteStackView.alignment = UIStackView.Alignment.center
        websiteStackView.spacing = 20.0

        websiteStackView.addArrangedSubview(websiteLabel)
        websiteStackView.addArrangedSubview(website)
        websiteStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentview.addSubview(websiteStackView)

        //Constraints
        websiteStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        websiteStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let addressStackView = UIStackView()
        addressStackView.axis = NSLayoutConstraint.Axis.horizontal
        addressStackView.distribution  = UIStackView.Distribution.equalSpacing
        addressStackView.alignment = UIStackView.Alignment.center
        addressStackView.spacing = 20.0

        addressStackView.addArrangedSubview(addressLabel)
        addressStackView.addArrangedSubview(address)
        addressStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentview.addSubview(addressStackView)

        //Constraints
        websiteStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        websiteStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    
        
        
        let imageContainerView = UIView()
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.backgroundColor = .clear
        imageContainerView.addSubview(defaultImage)
        
        defaultImage.widthAnchor.constraint(equalTo: defaultImage.heightAnchor).isActive = true
        defaultImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
        defaultImage.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        defaultImage.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        defaultImage.topAnchor.constraint(equalTo: imageContainerView.topAnchor).isActive = true
        
        
        let textStackView = UIStackView()
        textStackView.axis = NSLayoutConstraint.Axis.vertical
        textStackView.distribution  = .equalSpacing
        textStackView.alignment = .fill
        textStackView.spacing = 12.0

        
        textStackView.addArrangedSubview(nameStackView)
        textStackView.addArrangedSubview(userNameStackView)
        textStackView.addArrangedSubview(emailStackView)
        textStackView.addArrangedSubview(phoneStackView)
        textStackView.addArrangedSubview(websiteStackView)
        textStackView.addArrangedSubview(addressStackView)

        
        textStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentview.addSubview(textStackView)

        //Constraints
        NSLayoutConstraint.activate([
            textStackView.topAnchor.constraint(equalTo: contentview.topAnchor),
            textStackView.leadingAnchor.constraint(equalTo: contentview.leadingAnchor, constant: 30),
            textStackView.trailingAnchor.constraint(equalTo: contentview.trailingAnchor, constant: -30),
            textStackView.bottomAnchor.constraint(equalTo: contentview.bottomAnchor)
            
        ])
        
        
        let buttonStackView = UIStackView()
        buttonStackView.axis = NSLayoutConstraint.Axis.vertical
        buttonStackView.distribution  = .equalSpacing
        buttonStackView.alignment = .fill
        buttonStackView.spacing = 18.0
        
        buttonStackView.addArrangedSubview(postButton)
        buttonStackView.addArrangedSubview(albomButton)
        buttonStackView.addArrangedSubview(toDos)
    
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentview.addSubview(buttonStackView)

        //Constraints
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: contentview.topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: contentview.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: contentview.trailingAnchor, constant: -30),
            buttonStackView.bottomAnchor.constraint(equalTo: contentview.bottomAnchor)
            
        ])
        
        
        let imageStack = UIStackView()
        imageStack.axis = NSLayoutConstraint.Axis.vertical
        imageStack.distribution  = .equalSpacing
        imageStack.alignment = .fill
        imageStack.spacing = 50.0
        
        imageStack.addArrangedSubview(imageContainerView)
    
        imageStack.translatesAutoresizingMaskIntoConstraints = false

        self.contentview.addSubview(imageStack)

        //Constraints
        NSLayoutConstraint.activate([
            imageStack.topAnchor.constraint(equalTo: contentview.topAnchor),
            imageStack.leadingAnchor.constraint(equalTo: contentview.leadingAnchor, constant: 30),
            imageStack.trailingAnchor.constraint(equalTo: contentview.trailingAnchor, constant: -30),
            imageStack.bottomAnchor.constraint(equalTo: contentview.bottomAnchor)
            
        ])
        
        
        
        let mainStackView = UIStackView()
        mainStackView.axis = NSLayoutConstraint.Axis.vertical
        mainStackView.distribution  = .equalSpacing
        mainStackView.alignment = .fill
        mainStackView.spacing = 30.0
        
        mainStackView.addArrangedSubview(imageStack)
        mainStackView.addArrangedSubview(textStackView)
        mainStackView.addArrangedSubview(buttonStackView)
    
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentview.addSubview(mainStackView)

        //Constraints
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentview.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentview.leadingAnchor, constant: 30),
            mainStackView.trailingAnchor.constraint(equalTo: contentview.trailingAnchor, constant: -30),
            mainStackView.bottomAnchor.constraint(equalTo: contentview.bottomAnchor),
            mainStackView.heightAnchor.constraint(equalTo: contentview.heightAnchor)
            
        ])
        
        
    }
    
    @objc func addressbuttonAction(_ sender:UIButton!) {
        let vc = mapViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func albomButtonAction(_ sender:UIButton!) {
        
    }
    
    @objc func toDosButtonAction(_ sender:UIButton!) {
        
    }
    
    @objc func postButtonAction(_ sender:UIButton!) {
        let vc = postViewController()
        vc.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
  
}
