//
//  ConnectionManager.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 12/01/22.
//

import Foundation

class ConnectionManager {
    weak private var connectionDelegate: ConnectionDelegate?
    private var serviceManager: ServiceManagerProtocol
    
    init(serviceManager: ServiceManagerProtocol = ServiceManager()){
        self.serviceManager = serviceManager
    }
    
    func setViewDelegate(connectionDelegate: ConnectionDelegate?) {
        self.connectionDelegate = connectionDelegate
    }
    
    func loadCatalogueElements(with url: String) {
        serviceManager.executeUsersApiCall(with: url,
                                                completion: { [weak self] result in
                                                    self?.connectionDelegate?.displayUsersResult(result)
        })
        
        
    }
}
