//
//  CollectionViewController.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 13/12/21.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserModel.getList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DataCollectionViewCell else{
            return UICollectionViewCell()
        }
        let users = UserModel.getList()
        let userModel = users[indexPath.row]
        cell.dataLabel.text = userModel.userName
        cell.image.image = UIImage(named: userModel.profilePic)
        return cell
    }

}
