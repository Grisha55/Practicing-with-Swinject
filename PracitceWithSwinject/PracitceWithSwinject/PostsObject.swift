//
//  PostsObject.swift
//  PracitceWithSwinject
//
//  Created by Григорий Виняр on 07/08/2022.
//

import Foundation

struct PostObject: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
