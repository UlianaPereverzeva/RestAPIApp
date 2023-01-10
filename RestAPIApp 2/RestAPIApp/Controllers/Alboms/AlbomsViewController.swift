//
//  AlbomsViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 4.01.23.
//

import UIKit
import SwiftyJSON
import Alamofire

class AlbomsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var tableView: UITableView!
    var user: User!
    var alboms: [JSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        NetworkService.fetchAlboms(userID: user.id) { [weak self] result, error in
            if let result = result {
                self?.alboms = result
                self?.tableView.reloadData()
            } else if let error = error {
                print(error)
            }
        }
        
        tableView.backgroundColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
        navigationItem.title = "Alboms"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.78, green: 0.88, blue: 0.78, alpha: 1.00)
    }
    
    
    
    func setUpTableView(){
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(AlbomTableViewCell.self, forCellReuseIdentifier: "cellForAlbom")
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alboms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellForAlbom", for: indexPath) as? AlbomTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(titleOfAlbom: (alboms[indexPath.row]["id"].int ?? 0).description, textOfAlbom: alboms[indexPath.row]["title"].stringValue)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PhotosCollectionViewController()
        let albom = alboms[indexPath.row]
        vc.albom = albom
        vc.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


