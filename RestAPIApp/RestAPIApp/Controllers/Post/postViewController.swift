//
//  postViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 29.12.22.
//

import UIKit

class postViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var post: [Post] = []
    var user: User?
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        view.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
        tableView.backgroundColor = .clear//UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
        navigationItem.title = "Posts"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        navigationItem.rightBarButtonItems = [add]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchPost()
    }
    
    func fetchPost() {
        
        guard let userID = user?.id else {return}
        let pathUrl = "\(ApiConstans.postsPath)?userId=\(userID)"
        guard let url = URL(string: pathUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, _ in
            
            guard let data = data else { return }
            if let response = response{
                print(response)
            }
            do {
                self.post = try JSONDecoder().decode([Post].self, from: data)
                
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    
    private func setupTableView() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(postTableViewCell.self, forCellReuseIdentifier: "cellForPost")
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView = tableView
       }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = post[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellForPost", for: indexPath) as? postTableViewCell else {
            return UITableViewCell()
            }
        cell.configure(title: post.title ?? "" , text: post.body ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        self.post.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .fade)
      }
    }
    
    @objc func addTapped(_ sender:UIButton!) {
        let vc = CreatingPostViewController()
        vc.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
