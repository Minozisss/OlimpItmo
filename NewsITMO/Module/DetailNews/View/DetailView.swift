//
//  DetailNewsView.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    // MARK: - Properties
    var article: Article
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                BackButton()
                
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .foregroundStyle(.secondary.opacity(0.4))
                    
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .foregroundStyle(.secondary.opacity(0.8))
                    
                    WebImage(url: article.urlToImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.size.width - 32 ,height: 300)
                    
                    
                }
                .clipShape(.rect(cornerRadius: 15))
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(article.title)
                        .titleText()
                    
                    if let desc = article.description {
                        Text(desc)
                            .descriptionText()
                    }
                    
                    
                    
                    Text(article.publishedAt.dateToString())
                        .dateText()
                }
            }
            .padding()
            .clipShape(.rect(cornerRadius: 15))
            .navigationBarBackButtonHidden(true)
        }
    }
}

//#Preview {
//    DetailView()
//}
