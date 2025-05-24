//
//  NewsViewModel.swift
//  MyNewsApp
//
//  Created by Satheesh on 24/05/25.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = true
    private var page = 1
    private let newsService = NewsService()
    private let coreDataManager = CoreDataManager.shared

    init() {
        loadNewsWithFallback()
    }

    func loadNewsWithFallback() {
        newsService.fetchNews { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                    self?.coreDataManager.saveArticles(articles)
                    self?.isLoading = false
                case .failure:
                    self?.loadOfflineNews()
                }
            }
        }
    }

    func loadOfflineNews() {
        articles = coreDataManager.fetchArticles()
        isLoading = false
    }
}
