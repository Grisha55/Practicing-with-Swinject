//
//  NetworkService.swift
//  PracitceWithSwinject
//
//  Created by Григорий Виняр on 07/08/2022.
//

import Foundation

protocol Network: AnyObject {
    func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T) -> Void)
}

class NetworkService: Network {
    
    func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T) -> Void) {
        let memoryCapacity = 500 * 1024 * 1024
        let diskCapacity = 500 * 1024 * 1024
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity)
        configuration.httpMaximumConnectionsPerHost = 5
        
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: urlString) else { return }
        session.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(object)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
