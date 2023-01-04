//
//  UsersViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 28.12.22.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchUsers()
        tableView.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
        navigationItem.title = "Users"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)

        // Do any additional setup after loading the view.
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
       tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
       self.tableView = tableView
      }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.configure(name: user.name ?? "", surname: user.username ?? "")
        return cell
    }
    
    private func fetchUsers() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                self?.users = try JSONDecoder().decode([User].self, from: data)
            } catch {
                print(error)
            }
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        let vc = DetailInformationViewController()
        vc.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


