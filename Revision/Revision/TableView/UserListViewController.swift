//
//  UserListViewController.swift.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 13/12/21.
//

import UIKit

class UserListViewCrontroller: UIViewController{
    private let connectionManager = ConnectionManager()
    var result = Array<User>()
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80.0
        tableView.register(CustomCell.self, forCellReuseIdentifier: "\(CustomCell.self)")
        tableView.register(HeaderSectionCell.self, forHeaderFooterViewReuseIdentifier: "\(HeaderSectionCell.self)")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        connectionManager.setViewDelegate(connectionDelegate: self)
        connectionManager.loadCatalogueElements(with: urlUsers)
        tableView.reloadData()
    }
    

    private func configureView(){
        view.addSubview(tableView)
        var topPadding : CGFloat = 0.0
        if let topInset = UIApplication.shared.windows.first?.safeAreaInsets.top{
            topPadding = topInset
        }
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension UserListViewCrontroller : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomCell.self)", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        let user = result[indexPath.row]
        cell.setData(with: user)
        cell.accessoryType = .detailButton
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let customAlert = AlertDialog()
        customAlert.showAlert(name: result[indexPath.row].name, index: indexPath, viewController: self)
        
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            result.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
            
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(HeaderSectionCell.self)") as? HeaderSectionCell else{
            return UITableViewHeaderFooterView()
        }
        headerCell.setData(title: "Lista Usuarios Programático")
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

extension UserListViewCrontroller : ConnectionDelegate {
    func displayUsersResult(_ elements: [User]?) {
        self.result = elements ?? Array<User>()
        self.tableView.reloadData()
    }
    
    
}

/*extension UserListViewCrontroller{
    
    private func showSimpleAlert(text:String, index: IndexPath){
        let alert = UIAlertController(title: "Salir", message: "Desea salir: \(text) ", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: { _ in
            
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { [self](_:UIAlertAction!) in
        
            self.users.remove(at: index.row)
            self.tableView.deleteRows(at: [index], with: .fade)
            
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    private func showSimpleActionSheet(text:String, index: IndexPath) {
        let alert = UIAlertController(title: text, message: "Selecciones una opcion        ", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ingresar", style: .default, handler: {(_) in
            print("Click Aprove")
        }))
        alert.addAction(UIAlertAction(title: "Salir", style: .destructive, handler: {(_) in
            self.users.remove(at: index.row)
            self.tableView.deleteRows(at: [index], with: .fade)
        }))
    
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    private func showAlert(name:String, index: IndexPath) {
        switch name.first {
        case "I":
            showSimpleAlert(text: name, index: index)
        case "H":
            showSimpleActionSheet(text: name, index: index)
        default:
            print(name)
        }
    }
}*/
