//
//  NewsITMOApp.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import SwiftUI

@main
struct NewsITMOApp: App {
    // MARK: - Properties
    @State var path = NavigationPath()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                AuthView(path: $path)
                    .navigationDestination(for: Pages.self) { page in
                        switch page {
                        case .main:
                            NewsView(path: $path)
                        case .article(let article):
                            DetailView(article: article)
                        }
                    }
                    
            }
            
        }
    }
}
