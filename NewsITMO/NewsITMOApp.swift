//
//  NewsITMOApp.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import SwiftUI

@main
struct NewsITMOApp: App {
    @State var path = NavigationPath()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                NewsView(path: $path)
                    .navigationDestination(for: Pages.self) { page in
                        switch page {
                        case .article(let article):
                            DetailView(article: article)
                        }
                    }
                    
            }
            
        }
    }
}
