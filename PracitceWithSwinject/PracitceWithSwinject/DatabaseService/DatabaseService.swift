//
//  DatabaseService.swift
//  PracitceWithSwinject
//
//  Created by Григорий Виняр on 07/08/2022.
//

import Foundation

protocol Database: AnyObject {
    func getPostsFromDatabase(count: Int)
}

class DatabaseService: Database {
    
    func getPostsFromDatabase(count: Int) {
        for num in 1...count {
            let post = PostObject(userId: num, id: num, title: "\(num)", body: "\(num)")
            print(post)
        }
    }
    
}
