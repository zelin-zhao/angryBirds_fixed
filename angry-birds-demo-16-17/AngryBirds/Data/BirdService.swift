//
//  BirdService.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 4/13/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import Foundation

enum BirdCallingError: Error {
    case problemGeneratingURL
    case problemGettingDataFromAPI
    case problemDecodingData
}

class BirdService {
    private let urlString = "http://www.mocky.io/v2/5e9d1faf30000022cb0a80e1"
    
    func getBirds(completion: @escaping ([Bird]?, Error?) -> ()) {
            guard let url = URL(string: self.urlString) else {
                DispatchQueue.main.async { completion(nil, BirdCallingError.problemGeneratingURL) }
                return
        }
                
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async { completion(nil, BirdCallingError.problemGettingDataFromAPI) }
                    return
                }
                
                do {
                    let birdResult = try JSONDecoder().decode(BirdResult.self, from: data)
                    DispatchQueue.main.async { completion(birdResult.birds, nil) }
                } catch (let error) {
                    print(error)
                    DispatchQueue.main.async { completion(nil, BirdCallingError.problemDecodingData) }
                }
                                                        
            }
            task.resume()
        }
}
