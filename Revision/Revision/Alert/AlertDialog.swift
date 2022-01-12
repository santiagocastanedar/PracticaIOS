//
//  AlertDialog.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 3/01/22.
//

import UIKit

class AlertDialog {
    
    private func showSimpleAlert(text:String, index: IndexPath, viewController: UserListViewCrontroller){
        let alert = UIAlertController(title: "Salir", message: "Desea salir: \(text) ", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: { _ in
            
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(_:UIAlertAction!) in
        
            viewController.result.remove(at: index.row)
            viewController.tableView.deleteRows(at: [index], with: .fade)
            
            
        }))
        viewController.present(alert, animated: true, completion: nil)
    }
    private func showSimpleActionSheet(text:String, index: IndexPath,viewController: UserListViewCrontroller) {
        let alert = UIAlertController(title: text, message: "Selecciones una opcion        ", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ingresar", style: .default, handler: {(_) in
            print("Click Aprove")
        }))
        alert.addAction(UIAlertAction(title: "Salir", style: .destructive, handler: {(_) in
            viewController.result.remove(at: index.row)
            viewController.tableView.deleteRows(at: [index], with: .fade)
        }))
    
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))
        
        viewController.present(alert, animated: true, completion: nil)
    }
    func showAlert(name:String, index: IndexPath,viewController: UserListViewCrontroller) {
        
        if (name.first == "C") {
            showSimpleAlert(text: name, index: index, viewController: viewController)
        } else {
            showSimpleActionSheet(text: name, index: index, viewController: viewController)
        }
//        switch name.first {
//        case "C":
//            showSimpleAlert(text: name, index: index, viewController: viewController)
//        case "H":
//            showSimpleActionSheet(text: name, index: index, viewController: viewController)
//        default:
//            print(name)
//        }
    }
}
