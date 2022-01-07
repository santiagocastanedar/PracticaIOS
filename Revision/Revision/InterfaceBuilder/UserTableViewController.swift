//
//  UserTableViewController.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 13/12/21.
//

import UIKit

class UserTableViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    
    private var drinks:[Drink] = []
    let firstLetter: String = "b"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=\(firstLetter)"
        getData(from: url)
        configureTableView()
        
        
    }

    private func configureTableView(){
        let nibName = UINib(nibName: "\(UserTableViewCell.self)", bundle: nil)
        tableview.register(nibName, forCellReuseIdentifier: "\(UserTableViewCell.self)")
        tableview.reloadData()
    }
    private func getData(from url: String){
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self]data, response, error in
            guard let data = data,error == nil else {
                print("error")
                return
            }
            DispatchQueue.main.async {
                //Recuperar data
                var result: Response?
                do {
                    
                    result = try JSONDecoder().decode(Response.self, from: data)
                }
                catch{
                    print("Error: \(error.localizedDescription)")
                }
                
                guard let json = result else{
                    return
                }
                drinks = json.drinks
                tableview.reloadData()
            }
        }).resume()
    }

}

extension UserTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(UserTableViewCell.self)", for: indexPath) as? UserTableViewCell else{
            return UITableViewCell()
        }
        let drink = drinks[indexPath.row]
        cell.setData(drink:drink)
        cell.accessoryType = .detailButton
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = CustomViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}
