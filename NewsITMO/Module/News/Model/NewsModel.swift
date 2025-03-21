//
//  NewsModel.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import Foundation

struct NewsModel: Decodable, Hashable{
    var articles: [Article]
}

struct Article: Decodable, Hashable{
    var title: String
    var description: String?
    var url: URL
    var urlToImage: URL?
    var publishedAt: Date
}
