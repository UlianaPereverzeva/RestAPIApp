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
    private let reuseIdentifier = "Cell"
    private let usersActions = UsersActions.allCases
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureCollectionView()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.23, green: 0.13, blue: 0.22, alpha: 1.00)
        self.view.backgroundColor = UIColor(red: 0.76, green: 0.88, blue: 0.77, alpha: 1.00)
        updateTableViewContentInset()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return usersActions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
//        let xConstraint = NSLayoutConstraint(item: cell, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
//
//        let yConstraint = NSLayoutConstraint(item: cell, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
//
//        NSLayoutConstraint.activate([xConstraint, yConstraint])
//
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
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
