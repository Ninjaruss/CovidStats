//
//  CovidAPI.swift
//  CovidStats
//
//  Created by Russell Azu on 5/18/20.
//  Copyright © 2020 Russell Azu. All rights reserved.
//

import Foundation

struct JsonResponse: Codable{
    let Global: Global?
    let Countries: [Country?]
    let Date: String?
}

struct Country: Codable{
    let Country:String
    let CountryCode:String
    let Slug:String
    let NewConfirmed:Int
    let TotalConfirmed:Int
    let NewDeaths:Int
    let TotalDeaths:Int
    let NewRecovered:Int
    let TotalRecovered:Int
    let Date:String
}

struct Global: Codable{
    let NewConfirmed:Int
    let TotalConfirmed:Int
    let NewDeaths:Int
    let TotalDeaths:Int
    let NewRecovered:Int
    let TotalRecovered:Int
}

class CovidAPI{
    let url = URL(string: "https://api.covid19api.com/summary")!
    
    public func FetchSummary(completion: @escaping ((JsonResponse?) -> Void)){
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(JsonResponse.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        completion(decodedResponse)
                    }
                    // everything is good, so we can exit
                }
            }
        }
        task.resume()
        return
    }
}
