//
//  TableViewDataSource.swift
//  PracitceWithSwinject
//
//  Created by Григорий Виняр on 07/08/2022.
//

import Foundation
import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    var posts: [PostObject] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }
    
    
}
