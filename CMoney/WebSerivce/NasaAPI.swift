//
//  NasaAPI.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import Foundation


typealias CompletionHandler = (_ model: NasaModel) -> Void
typealias FailedHandler = () -> Void


class NasaAPI: NSObject {
    
    private let sourceLink =
        "https://raw.githubusercontent.com/cmmobile/NasaDataSet/main/apod.json"
    
    func apiTo(completion: @escaping CompletionHandler,
               failed: @escaping FailedHandler) {
        
        guard let url = URL(string: sourceLink) else {
            failed()
            return
        }
        
        let restManager = RestManager()
        restManager.getData(fromURL: url) { (data) in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let nasa = try? decoder.decode([Nasa].self, from: data) else {
                    failed()
                    return
                }
                let nasaModel = NasaModel(data: nasa)
                completion(nasaModel)
            } else {
                failed()
            }
        }
    }
}
