//
//  OneNews.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct OneNews: View {
    // MARK: - Properties
    var article: Article
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                Rectangle()
                    .frame(width: 260, height: 130)
                    .foregroundStyle(.secondary.opacity(0.4))
                
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .foregroundStyle(.secondary.opacity(0.8))
                
                WebImage(url: article.urlToImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 260, height: 130)
                
                
            }
            .clipShape(.rect(cornerRadius: 15))
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .titleText()
                    .lineLimit(2)
                
                Spacer()
                
                Text(article.publishedAt.dateToString())
                    .dateText()
            }
        }
        .frame(width: 260, height: 260)
        .padding()
        .background(.background)
        .clipShape(.rect(cornerRadius: 15))
    }
}
