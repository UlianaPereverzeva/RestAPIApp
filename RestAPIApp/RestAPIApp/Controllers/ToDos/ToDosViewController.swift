//
//  ToDosViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 8.01.23.
//

import UIKit
import Alamofire

class ToDosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var tableView: UITableView!
    var user: User?
    var toDo = [ToDos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromToDos()
        setUpTableView()
        self.tableView.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
        self.navigationItem.title = "ToDos"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
   }
    
    func setUpTableView() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(ToDosTableViewCell.self, forCellReuseIdentifier: "cellForToDos")
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView = tableView
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDo[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellForToDos", for: indexPath) as? ToDosTableViewCell else {
            return UITableViewCell()
            }
        cell.configureToDosCell(title: toDo.title ?? "", completed: "completed: \(String(toDo.completed))")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDo.count
    }
    
    private func getDataFromToDos(){
        guard let userId = user?.id else { return }
        NetworkService.getToDos(userID: userId) {[weak self] result, error in

                guard let toDo = result else { return }
                self?.toDo = toDo
                self?.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
