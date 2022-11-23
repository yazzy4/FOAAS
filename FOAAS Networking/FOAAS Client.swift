//
//  FOAAS Client.swift
//  FOAAS Networking
//
//  Created by Yaz Burrell on 11/23/22.
//

import Foundation

struct FOAASClient {
    
    func fetchMessages(completion: @escaping(FOAAS)-> Void) {
        guard let url = URL(string: "https:www.foaas.com/equity/:name/:from") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("DEBUG: error fetching messages: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(FOAAS.self, from: jsonData)
                completion(decodedData)
                print(decodedData)
            } catch {
                print("DEBUG: error decoding message data")
            }
        }
        dataTask.resume()
    }
}
