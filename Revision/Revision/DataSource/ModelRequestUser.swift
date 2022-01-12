//
//  ModelRequestUser.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 12/01/22.
//

import Foundation

struct ModelRequestUser: ApiResourceProtocol {
    typealias ResponseType =  [User]
    
    var url: URL
    
    init(url: String){
        guard let routeUrl = URL(string: url) else {
            fatalError()
        }
        self.url = routeUrl
    }
}
