//
//  ViewController.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 13/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.layer.cornerRadius = logoImageView.bounds.height / 2
        logoImageView.layer.borderWidth = 3
        logoImageView.layer.borderColor = UIColor.black.cgColor
        logoImageView.clipsToBounds = true
    }
    @IBAction func goToTableViewButton(_ sender: Any) {
        let viewController = UserTableViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

