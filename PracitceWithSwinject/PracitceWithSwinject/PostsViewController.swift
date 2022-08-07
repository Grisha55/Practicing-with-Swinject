//
//  ViewController.swift
//  PracitceWithSwinject
//
//  Created by Григорий Виняр on 07/08/2022.
//

import UIKit
import Swinject

class PostsViewController: UIViewController {
    
    var dataSource: TableViewDataSource!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        setupUI()
        dataSource.posts.append(PostObject(userId: 5, id: 7, title: "Some title", body: "Some body"))
        tableView.reloadData()
    }

    private func setupUI() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = dataSource
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
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

extension PostsViewController: UITableViewDelegate {
    
}
