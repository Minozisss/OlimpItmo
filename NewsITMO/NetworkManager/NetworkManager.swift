//
//  NetworkManager.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import Foundation
import Alamofire

class NetworkManager {
    // MARK: - Properties
    static let shared = NetworkManager()
    var decoder = JSONDecoder()
//    var param: Parameters?
    
    // MARK: - Init
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    // MARK: - Methods
    
    func sendRequest(url: String, param: Parameters? = nil, completion: @escaping(Result <[Article], Error>) -> Void) {
        guard let reachabilityManager = NetworkReachabilityManager(), reachabilityManager.isReachable else {
            completion(.failure(NetworkErrors.noInternet))
            return
        }
        
        AF.request(
            url,
            method: .get,
            parameters: param
        ).validate().response { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else {
                        completion(.failure(NetworkErrors.noData))
                        return
                    }
                    let result = try self.decoder.decode(NewsModel.self, from: data)
                    completion(.success(result.articles))
                } catch {
                    completion(.failure(NetworkErrors.invalidDecoding))
                    return
                }
            case .failure(_):
                completion(.failure(NetworkErrors.invalidResponse))
            }
        }
        
    }
    
    func setParam(promt: String) -> Parameters {
        let param: Parameters = [
            "apiKey" : "4ec7e121ad774facbbb3d884513b134a",
            "q" : promt,
            "searchIn" : "title",
            "sortBy" : "relevancy"
        ]
        return param
    }
}
