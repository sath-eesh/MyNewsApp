//
//  NewsListView.swift
//  MyNewsApp
//
//  Created by Satheesh on 24/05/25.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel()
    @State private var searchText = ""

    var filteredArticles: [Article] {
        if searchText.isEmpty {
            return viewModel.articles
        } else {
            return viewModel.articles.filter { $0.title?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                    TextField("Search here...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding(.horizontal, 10)
                .frame(height: 36)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding([.horizontal, .top], 12)

                // Loading or List
                if viewModel.isLoading {
                    Spacer()
                    ProgressView("Loading news...")
                    Spacer()
                } else {
                    List {
                        ForEach(Array(filteredArticles.enumerated()), id: \.1.id) { index, article in
                            ZStack {
                                if index == 0 {
                                    LargeNewsItemView(article: article)
                                } else {
                                    SmallNewsItemView(article: article)
                                }

                                NavigationLink(destination: NewsDetailView(article: article)) {
                                    EmptyView()
                                }
                                .opacity(0)
                            }
                            .listRowInsets(EdgeInsets())
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
