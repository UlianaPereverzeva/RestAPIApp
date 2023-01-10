//
//  ActionsCollectionViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 27.12.22.
//

import UIKit

enum UsersActions: String, CaseIterable{
    case downloadImage = "Download Image"
    case users = "Users"
}



class ActionsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private var collectionView: UICollectionView?
    private let usersActions = UsersActions.allCases
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureCollectionView()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.view.backgroundColor = UIColor(red: 0.76, green: 0.88, blue: 0.77, alpha: 1.00)
        updateTableViewContentInset()
    }

    private func configureCollectionView() {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        self.collectionView = collectionView
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return usersActions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(title: usersActions[indexPath.item].rawValue, backgroundColor: UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         CGSize(width: collectionView.bounds.width - 20, height: 70)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch usersActions[indexPath.row] {
        case .downloadImage:
            let vc1 = ImageViewController()
            self.navigationController?.pushViewController(vc1, animated: true)
        case .users:
            let vc2 = UsersViewController()
            self.navigationController?.pushViewController(vc2, animated: true)
        }
    }
    
    func updateTableViewContentInset() {
        let viewHeight: CGFloat = view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        let collectionViewContentHeight: CGFloat = CGFloat(70 * usersActions.count) + CGFloat(70 * (usersActions.count - 1))//collectionView?.contentSize.height ?? 0
        let marginHeight: CGFloat = (viewHeight - collectionViewContentHeight) / 2.0

        self.collectionView?.contentInset = UIEdgeInsets(top: marginHeight + view.safeAreaInsets.top, left: 0, bottom: marginHeight + view.safeAreaInsets.bottom, right: 0)
    }
    
}
