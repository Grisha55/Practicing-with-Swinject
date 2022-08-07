//
//  Assembly.swift
//  PracitceWithSwinject
//
//  Created by Григорий Виняр on 07/08/2022.
//

import Foundation
import Swinject

class BaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Network.self) { factory -> NetworkService in
            let vc = PostsViewController()
            vc.dataSource = TableViewDataSource()
            return NetworkService()
        }
        
        container.register(Database.self) { factory -> DatabaseService in
            return DatabaseService()
        }
    }
    
    init(container: Container) {
        assemble(container: container)
    }
}

extension Assembler {
    static let sharedAssembly: Assembler = {
        
        let container = Container()
        let assembler = Assembler([BaseAssembly(container: container)])
        
        
        return assembler
    }()
}
