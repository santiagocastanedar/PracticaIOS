//
//  ThemeViewController.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 11/01/22.
//

import UIKit

class ThemeViewController: UIViewController {
    
    @IBOutlet weak var lightButton: UIButton!
    @IBOutlet weak var darkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func applyTheme() {
        view.backgroundColor = Theme.current.background
        lightButton.tintColor = Theme.current.accent
        darkButton.tintColor = Theme.current.tint
        
    }
    
    @IBAction func darkTheme(_ sender: Any) {
        Theme.current = DarkTheme()
        applyTheme()
        
    }
    
    @IBAction func lightTheme(_ sender: Any) {
        Theme.current = LightTheme()
        applyTheme()
    }
}
