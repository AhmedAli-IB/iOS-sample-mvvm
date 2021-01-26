//
//  HomeViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var upcommingSessionLogo: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }

    @IBAction func searchTapped(_ sender: Any) {
    }
}

// MARK: - Configuration
//
private extension HomeViewController {
    
    /// Configure View
    ///
    func configureView() {
        configureHeaderView()
        func registerCell() {
            tableView.register(UINib(nibName: Strings.tableViewCellId, bundle: nil),
                               forCellReuseIdentifier: Strings.tableViewCellId)
          }
    }
   
}

private extension HomeViewController {
    
    enum Strings {
        static let collectionViewCellId = "CardCollectionViewCell"
        static let tableViewCellId = "SessionTableViewCell"
    }
    
    enum Constants {
       
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func configureHeaderView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        let headerView = UICollectionView(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: 345,
                                                        height: 211),
                                          collectionViewLayout: layout)
        headerView.backgroundColor = .blue
        headerView.isPagingEnabled = true
        headerView.isUserInteractionEnabled = true

        headerView.dataSource = self
        headerView.delegate = self
        headerView.register(UINib(nibName: Strings.collectionViewCellId,
                                  bundle: nil),
                            forCellWithReuseIdentifier: Strings.collectionViewCellId)
        
        headerView.showsHorizontalScrollIndicator = true
        tableView.tableHeaderView = headerView
    }

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.collectionViewCellId,
                                                      for: indexPath) as! CardCollectionViewCell
        return cell
    }

    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 345, height: 211)
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144.0
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Strings.tableViewCellId,
                                                 for: indexPath) as! SessionTableViewCell
        return cell
    }

}
