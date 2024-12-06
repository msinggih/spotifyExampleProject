//
//  NamedPlaylistVC.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 06/12/24.
//

import UIKit
protocol NamedPlaylistDelegate {
    func confirmButtonAction()
}

class NamedPlaylistVC: UIViewController {
    @IBOutlet weak var confirmButton: UIButton!
    
    var delegate: NamedPlaylistDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        confirmButton.layer.cornerRadius = 26
        
    }

    @IBAction func confirmButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
        delegate?.confirmButtonAction()
    }
    
}
