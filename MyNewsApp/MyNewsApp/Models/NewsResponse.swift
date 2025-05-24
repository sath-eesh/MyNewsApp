//
//  NewsResponse.swift
//  MyNewsApp
//
//  Created by Satheesh on 24/05/25.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    var id: UUID { UUID() }
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
