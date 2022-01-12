//
//  ServiceManager.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 12/01/22.
//

import Foundation

protocol ServiceManagerProtocol {
    func executeUsersApiCall(with url: String,completion: @escaping ([User]?) -> Void)
}

class ServiceManager: ServiceManagerProtocol {
    var apiRequestUser: ApiRequest<ModelRequestUser>?
    
    func executeUsersApiCall(with url: String, completion: @escaping ([User]?) -> Void) {
        apiRequestUser = ApiRequest(resource: ModelRequestUser(url: url))
        apiRequestUser?.execute { (items) in
            completion(items)
        }
                            
    }
    
    
    
    
}
