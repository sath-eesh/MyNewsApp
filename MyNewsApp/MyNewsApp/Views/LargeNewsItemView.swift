//
//  LargeNewsItemView.swift
//  MyNewsApp
//
//  Created by Satheesh on 24/05/25.
//

import SwiftUI

struct LargeNewsItemView: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let imageUrl = article.urlToImage,
               let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                } placeholder: {
                    Image("placeholder")
                        .resizable()
                }
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .cornerRadius(10)
            }

            Text(article.title ?? "No title")
                .font(.headline)

            Text(article.publishedAt ?? "")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

