//
//  NewsViewModel.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import Foundation

@Observable
class NewsViewModel {
    // MARK: - Properties
    var news: [Article] = []
    var error: NetworkErrors? = nil
    var showError: Bool = false
    var promt: String = ""
    var scrollIndicator: Bool = false
    
    // MARK: - Init
    init () {
        fetchNews()
    }
    
    // MARK: - Methods
    func fetchNews() {
        NetworkManager.shared.sendRequest(url: ConstantURL.newsURL) { response in
            switch response {
            case .success(let articles):
                self.news = articles
                self.showError = false
                self.error = nil
                
                
            case .failure(let error):
                if let error = error as? NetworkErrors {
                    self.error = error
                    self.showError = true
                }
            }
        }
    }
    
    func searchNews() {
        NetworkManager.shared.sendRequest(url: ConstantURL.searchURL,
                                          param: NetworkManager.shared.setParam(promt: self.promt)) { response in
            switch response {
            case .success(let articles):
                self.news = articles
                self.showError = false
                self.error = nil
                self.scrollIndicator = false
                
            case .failure(let error):
                if let error = error as? NetworkErrors {
                    self.error = error
                    self.showError = true
                }
            }
        }
    }
}
