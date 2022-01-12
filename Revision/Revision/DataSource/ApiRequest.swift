//
//  ApiRequest.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 12/01/22.
//

import UIKit

protocol ApiResourceProtocol {
    associatedtype ResponseType: Decodable
    var url: URL {get}
}

protocol NetworkRequest {
    associatedtype T: Decodable
    
    func decode(_ data: Data) -> T?
    func execute(withCompletion completion: @escaping (T?) -> Void)
}

class ApiRequest <Resource: ApiResourceProtocol>: NetworkRequest {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
    
    func decode(_ data: Data) -> Resource.ResponseType? {
        let catalogueResponse = try? JSONDecoder().decode(Resource.ResponseType.self, from: data)

        return catalogueResponse
    }
    
    func execute(withCompletion completion: @escaping (Resource.ResponseType?) -> Void) {
        let task = URLSession.shared.dataTask(with: resource.url, completionHandler: {data, response, error in
            
            guard let data = data, error == nil, let value = self.decode(data) else{
                DispatchQueue.main.async { completion(nil) }
                return
            }
            
            DispatchQueue.main.async {
                completion(value)
            }
        })
        task.resume()
    }
    
    
}
