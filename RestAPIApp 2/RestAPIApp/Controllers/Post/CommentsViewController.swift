//
//  CommentsViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 3.01.23.
//

import UIKit
import SwiftUI

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var comments : [Comment] = []
    var postId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchComments()
        setupTableView()
        
        tableView.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
        navigationItem.title = "Comments"
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
        tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: "cellForComment")
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView = tableView
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = comments[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellForComment", for: indexPath) as? CommentsTableViewCell else {
            return UITableViewCell()
            }
        cell.configure(title: comment.name ?? "", comment: comment.body ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func fetchComments() {
        guard let postId = postId else { return }
        let pathURL = "\(ApiConstans.commentsPath)?postId=\(postId)"
        guard let url = URL(string: pathURL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }
            do {
                self.comments = try JSONDecoder().decode([Comment].self, from: data)
                print(self.comments)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete,
           let commentId = comments[indexPath.row].id {
            
            NetworkService.deleteComment(commentID: commentId) { [weak self] json, error in
                if json != nil{
                    self?.comments.remove(at: indexPath.row)
                    self?.tableView.deleteRows(at: [indexPath], with: .fade)
                } else if let error = error {
                    print(error)
                }
            }
        }
    }
}

