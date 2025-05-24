//
//  SmallNewsItemView.swift
//  MyNewsApp
//
//  Created by Satheesh on 24/05/25.
//

import SwiftUI

struct SmallNewsItemView: View {
    let article: Article

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title ?? "No title")
                    .font(.subheadline)
                    .lineLimit(3)

                Text(article.publishedAt ?? "")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

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
                .frame(width: 80, height: 60)
                .clipped()
                .cornerRadius(6)
            }
        }
        .padding()
    }
}
