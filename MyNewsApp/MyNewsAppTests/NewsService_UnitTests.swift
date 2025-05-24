//
//  NewsService_UnitTests.swift
//  MyNewsAppTests
//
//  Created by Satheesh on 24/05/25.
//

import XCTest
@testable import MyNewsApp

final class NewsService_UnitTests: XCTestCase {
    var newsService: NewsService!
    var urlSession: URLSession!

    override func setUp() {
        super.setUp()

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: config)

        newsService = NewsService(session: mockSession)
    }

    override func tearDown() {
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.stubError = nil
        super.tearDown()
    }

    func testFetchNewsSuccess() {
        // Given
        let sampleJSON = """
        {
            "articles": [
                {
                    "author": "Author 1",
                    "title": "Test Title",
                    "description": "Desc",
                    "url": "https://test.com",
                    "urlToImage": "https://image.com",
                    "publishedAt": "2023-01-01",
                    "content": "Some content"
                }
            ]
        }
        """.data(using: .utf8)

        MockURLProtocol.stubResponseData = sampleJSON

        let expectation = self.expectation(description: "News fetched")

        // When
        newsService.fetchNews { result in
            // Then
            switch result {
            case .success(let articles):
                XCTAssertEqual(articles.count, 1)
                XCTAssertEqual(articles.first?.title, "Test Title")
            case .failure:
                XCTFail("Expected success, got failure")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testFetchNewsFailure() {
        // Given
        MockURLProtocol.stubError = NSError(domain: "TestError", code: 0)

        let expectation = self.expectation(description: "News fetch failed")

        // When
        newsService.fetchNews { result in
            // Then
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

}
