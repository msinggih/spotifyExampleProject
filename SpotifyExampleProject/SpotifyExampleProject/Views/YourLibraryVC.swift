//
//  YourLibraryVC.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 06/12/24.
//

import UIKit

class YourLibraryVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var playlistTableView: UITableView!
    let nav = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        //setup playlist tableview
        playlistTableView.delegate = self
        playlistTableView.dataSource = self
        playlistTableView.register(UINib(nibName: "PlayListCell", bundle: nil), forCellReuseIdentifier: "PlayListCell")
        
        //Setup category collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionCell")
        
        //Navigation Controller setup
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func createPlaylistButtonTapped(_ sender: Any) {
        let vc = CreatePlaylistVC()
        vc.delegate = self
        let navVC = UINavigationController(rootViewController: vc)
        
        navVC.isModalInPresentation = true
        if let sheet = navVC.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                0.1 * context.maximumDetentValue
            }), .large()]
        }
        self.navigationController?.present(navVC, animated: true)
    }
}


extension YourLibraryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayListCell", for: indexPath) as! PlayListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}

extension YourLibraryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as! CategoryCollectionCell
        cell.setupUI(indexpathrow: indexPath.row)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 32)
    }
}


extension YourLibraryVC: CreatePlayListDelegate {
    func handleNavigation() {
        let vc = NamedPlaylistVC()
        present(vc, animated: true)
    }
}
