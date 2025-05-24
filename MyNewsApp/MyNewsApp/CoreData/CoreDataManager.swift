//
//  CoreDataManager.swift
//  MyNewsApp
//
//  Created by Satheesh on 24/05/25.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "NewsModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("CoreData load error: \(error)")
            }
        }
    }

    func saveArticles(_ articles: [Article]) {
        let context = container.viewContext

        // Delete existing articles
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = ArticleEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
         _ = try? context.execute(deleteRequest)
        try? context.save()

        // Add new articles
        for article in articles {
            let entity = ArticleEntity(context: context)
            entity.title = article.title
            entity.desc = article.description
            entity.url = article.url
            entity.urlToImage = article.urlToImage
            entity.publishedAt = article.publishedAt
            entity.author = article.author
            entity.content = article.content
        }

        try? context.save()
    }

    func fetchArticles() -> [Article] {
        let request: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        let results = try? container.viewContext.fetch(request)
        return results?.compactMap { entity in
            Article(
                author: entity.author,
                title: entity.title,
                description: entity.desc,
                url: entity.url,
                urlToImage: entity.urlToImage,
                publishedAt: entity.publishedAt,
                content: entity.content
            )
        } ?? []
    }
}
