//
//  Network.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 22/09/2024.
//

import Foundation

struct NetworkHelper {
    
    static func getData(url: URL, completion: @escaping (Data?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print(error?.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data exists")
                return
            }
            
            completion(data)
            
        }.resume()
        
        
        
    }
    
}
