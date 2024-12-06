//
//  CreatePlaylistVC.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 06/12/24.
//

import UIKit
protocol CreatePlayListDelegate {
    func handleNavigation()
}

class CreatePlaylistVC: UIViewController {
    var delegate : CreatePlayListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup UIView corner radius
        self.view.layer.cornerRadius = 4
        
        // setup tap gesture in UIView
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.dismiss(animated: true)
        delegate?.handleNavigation()
    }
}
