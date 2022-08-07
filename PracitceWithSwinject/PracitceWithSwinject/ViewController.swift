//
//  ViewController.swift
//  PracitceWithSwinject
//
//  Created by Григорий Виняр on 07/08/2022.
//

import UIKit
import Swinject

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }

    func getData() {
        let networkService = Assembler.sharedAssembly.resolver.resolve(Network.self)
        let database = Assembler.sharedAssembly.resolver.resolve(Database.self)
        
        print(networkService is NetworkService)
        print(database is DatabaseService)
        
        
        networkService?.fetchGenericData(urlString: "https://jsonplaceholder.typicode.com/posts", completion: { (object: [PostObject]) in
            print(object)
        })
        
        database?.getPostsFromDatabase(count: 10)
        
    }
}

