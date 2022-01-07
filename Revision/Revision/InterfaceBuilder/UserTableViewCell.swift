//
//  UserTableViewCell.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 13/12/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setData(drink:Drink){
        nameLabel.text = drink.strDrink
        descriptionLabel.text = drink.idDrink
        profilePic.load(urlString: drink.strDrinkThumb)
    }
    
}

extension UIImageView{
    func load(urlString : String){
        guard let url = URL(string: urlString)else{
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
