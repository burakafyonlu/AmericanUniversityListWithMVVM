//
//  WebService.swift
//  GetApiWithMVVM
//
//  Created by Burak Afyonlu on 30.04.2023.
//

import Foundation

class WebService {
    
    func downloadApi(url: URL , completion: @escaping ([SchoolList]?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
                    
               let schoolList = try? JSONDecoder().decode([SchoolList].self , from: data)
                
                print(schoolList as Any)
                    
                completion(schoolList)
            }
            
        }.resume()
        
    }
    
}
