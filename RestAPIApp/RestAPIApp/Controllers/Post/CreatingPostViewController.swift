//
//  CreatingPostViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 30.12.22.
//

import UIKit
import SwiftyJSON
import Alamofire

class CreatingPostViewController: UIViewController, UITextViewDelegate {

    var user: User?
    
    private var textView = UITextView()
    private var textField = UITextField()
    private var postWithURLbutton = UIButton()
    private var postWithAlamofirebutton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
        navigationItem.title = "Create new post"
        setUpUI()
        setUpButton()


    }
    
    func setUpUI() {
        let textF = UITextField()
        textF.placeholder = "Name of title"
        textF.layer.cornerRadius = 20.0
        textF.backgroundColor = .white
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textF.leftView = paddingView
        textF.leftViewMode = .always
        textF.layer.borderWidth = 2.0
        textF.layer.cornerRadius = 20.0
        
        
        textF.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        textF.textColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        textF.layer.borderColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00).cgColor
        textF.layer.borderWidth = 3.0
        textF.keyboardType = UIKeyboardType.default
        textF.returnKeyType = UIReturnKeyType.done
        textF.clearButtonMode = UITextField.ViewMode.whileEditing
        textF.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.textField = textF
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textField)

        
        NSLayoutConstraint.activate([
            
            self.textField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 14),
            self.textField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -14),
            self.textField.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        
        
        let viewText = UITextView()
        viewText.delegate = self
        viewText.layer.borderColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00).cgColor
        viewText.layer.borderWidth = 3.0
        viewText.layer.cornerRadius = 20.0
        viewText.contentInsetAdjustmentBehavior = .automatic
        viewText.center = self.view.center
        viewText.textAlignment = NSTextAlignment.justified
        viewText.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        viewText.text = "Please  your text"
        viewText.textColor = UIColor.lightGray
        viewText.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        self.textView = viewText
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textView)

        NSLayoutConstraint.activate([
            
            self.textView.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 10),
            self.textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.textView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        
    }

    func setUpButton(){
        let urlButton = UIButton(type: .system)
        urlButton.setTitle("post With URL", for: .normal)
        urlButton.addTarget(self, action: #selector(postWithURLButtonAction(_:)), for: .touchUpInside)
        urlButton.setTitleColor(UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00), for: .normal)
        urlButton.backgroundColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        urlButton.layer.cornerRadius = 30
        urlButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.postWithURLbutton = urlButton
        self.view.addSubview(postWithURLbutton)
        self.postWithURLbutton.translatesAutoresizingMaskIntoConstraints = false

        postWithURLbutton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        postWithURLbutton.topAnchor.constraint(equalTo: self.textView.bottomAnchor, constant: 30).isActive = true
        postWithURLbutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 14).isActive = true
        postWithURLbutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -14).isActive = true

        let alamofireButton = UIButton(type: .system)
        alamofireButton.setTitle("post With Alamofire", for: .normal)
        alamofireButton.addTarget(self, action: #selector(postWithAlamofireButtonAction(_:)), for: .touchUpInside)
        alamofireButton.setTitleColor(UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00), for: .normal)
        alamofireButton.backgroundColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        alamofireButton.layer.cornerRadius = 30
        alamofireButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.postWithAlamofirebutton = alamofireButton
        self.view.addSubview(postWithAlamofirebutton)
        self.postWithAlamofirebutton.translatesAutoresizingMaskIntoConstraints = false

        postWithAlamofirebutton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        postWithAlamofirebutton.topAnchor.constraint(equalTo: self.postWithURLbutton.bottomAnchor, constant: 14).isActive = true
        postWithAlamofirebutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 14).isActive = true
        postWithAlamofirebutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -14).isActive = true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Please enter your text"
            textView.textColor = UIColor.lightGray
        }
    }
    
    @objc func postWithURLButtonAction(_ sender:UIButton!) {
        
        if let userId = user?.id,
        let title = textField.text,
        let text = textView.text,
        let url = ApiConstans.postsPathURL {
            
            var request = URLRequest(url: url)
            
            //Header
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            
            //Body
            let postBodyJson: [String: Any] = [ "userId": userId,
                                                "title": title,
                                                "body": text]
            
            let httpBody = try? JSONSerialization.data(withJSONObject: postBodyJson, options: [])
            request.httpBody = httpBody
            
            //Create dataTask and post new request
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                print(response ?? "")
                
                if let data = data  {
                    print(data)
                    
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                    
                } else if let error = error {
                    print(error)
                }
            }.resume()
        }
    }
    
    @objc func postWithAlamofireButtonAction(_ sender:UIButton!) {
        
        if let userId = user?.id,
           let title = textField.text,
           let text = textView.text,
           let url = ApiConstans.postsPathURL {
            
            let parameters: Parameters = ["userId" : userId,
                                          "title" : title,
                                          "body" : text]
            
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
                debugPrint(response)
                print(response.request)
                print(response.response)
                debugPrint(response.result)
                
                switch response.result {
                case.success(let data):
                    guard let data = data else { return }
                    print(data)
                    print(JSON(data))
                    self.navigationController?.popViewController(animated: true)
                case.failure(let error):
                    print(error)
                }
            }
            
            
        }
        
        
    }
}

//class CustomSearchTextField: UITextField {
//   required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//   }
//
//   override func textRect(forBounds bounds: CGRect) -> CGRect {
//       return bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
//   }
//   override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//       return bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
// }
//}
