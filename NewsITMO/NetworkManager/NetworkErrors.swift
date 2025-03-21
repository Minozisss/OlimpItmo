//
//  NetworkErrors.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import Foundation

enum NetworkErrors: String, Error {
    case noInternet = "No Internet"
    case invalidDecoding = "Invalid decoding"
    case noData = "No data"
    case invalidResponse = "Invalid response"
}
