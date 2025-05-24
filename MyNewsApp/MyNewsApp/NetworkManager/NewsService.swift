//
//  NewsService.swift
//  MyNewsApp
//
//  Created by Satheesh on 24/05/25.
//

import Foundation

class NewsService {
    let apiKey = "2398dd6a78f7454f87c532c8eb991fd4"
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetchNews(page: Int = 1, completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=\(apiKey)&page=\(page)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }
            do {
                let result = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(.success(result.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
