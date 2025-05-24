//
//  NewsDetailView.swift
//  MyNewsApp
//
//  Created by Satheesh on 24/05/25.
//

import SwiftUI

struct NewsDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let url = article.urlToImage, let imageUrl = URL(string: url) {
                    AsyncImage(url: imageUrl) { image in
                        image.resizable()
                    } placeholder: {
                        Image("placeholder")
                            .resizable()
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(10)
                }

                Text(article.title ?? "")
                    .font(.system(size: 18))
                    .bold()
                
                Divider()
                
                HStack {
                    Text("Author: ")
                        .font(.system(size: 14))
                    Text(article.author ?? "UnKnown")
                        .font(.system(size: 14))
                        .bold()
                }

                Text(article.publishedAt ?? "")
                    .font(.system(size: 14))

                Divider()
                
                Text(article.content ?? "")
                    .font(.system(size: 16))
            }
            .padding()
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NewsDetailView(article: Article(
        author: "Brian McGleenon",
        title: "Bitcoin price holds above $102,000 as BlackRock leads fund inflows",
        description: "Bitcoin traded relatively flat on Thursday as institutional investors resumed allocations into US-based spot bitcoin exchange-traded funds on Wednesday.",
        url: "https://uk.finance.yahoo.com/news/bitcoin-price-blackrock-fund-inflows-083952678.html",
        urlToImage: "https://s.yimg.com/ny/api/res/1.2/VccZ29AP5EbMUUA1Bt5b8A--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD03Njk-/https://s.yimg.com/os/creatr-uploaded-images/2024-03/1a844b70-e77d-11ee-afed-082fc5f5ad1b",
        publishedAt: "2025-05-15T08:39:52Z",
        content: "Bitcoin (BTC-USD) traded relatively flat on Thursday, priced just above $102,200 (£76,989) down around 1% on the day as institutional investors resumed allocations into US-based spot bitcoin exchange… [+2465 chars]"
    ))
}
