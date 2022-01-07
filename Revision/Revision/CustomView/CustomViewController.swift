//
//  CustomViewController.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 29/12/21.
//

import UIKit

class CustomViewController: UIViewController {
    @IBOutlet weak var topCustomView: UIView!
    
    @IBOutlet weak var bottomCustomView: BackgroundUIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        customViewTop()
        self.bottomCustomView.nameLabel.text = "Abajo"
        bottomCustomView.customView.backgroundColor = UIColor.red
        bottomCustomView.nameLabel.textColor = UIColor.green
        
    }

    func customViewTop(){
        let topView = BackgroundUIView()
        topView.nameLabel.text = "Top"
        topView.customView.backgroundColor = UIColor.green
        topView.nameLabel.textColor = UIColor.red
        self.topCustomView.addSubview(topView)
        topView.frame = self.topCustomView.bounds
        
        
    }
}
