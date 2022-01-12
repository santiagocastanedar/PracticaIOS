//
//  ConnectionDelegate.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 11/01/22.
//

import Foundation

protocol ConnectionDelegate: NSObjectProtocol {
    func displayUsersResult(_ elements: [User]?)
}
