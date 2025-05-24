# 📰 MyNewsApp

This is an iOS News Application built using **Swift**, **MVVM architecture**, and **Core Data** for offline caching. It fetches news articles from the [NewsAPI.org](https://newsapi.org/) and displays them in a user-friendly list interface.

---

## 📱 Features

- ✅ Fetches news articles via **REST API**
- 📶 Caches articles locally using **Core Data**
- 🧠 Built using **MVVM architecture**
- 📡 Fallback to offline articles when the network fails
- 🧪 Includes **unit tests** for service and view model layers

---

## 🛠️ Tech Stack

| Component       | Technology       |
|----------------|------------------|
| Language        | Swift            |
| Architecture    | MVVM             |
| Offline Storage | Core Data        |
| Networking      | URLSession       |
| Testing         | XCTest           |
| Dependency      | NewsAPI.org      |

---

## 🚀 Getting Started

### 1. Clone the Repo

```
git clone https://github.com/yourusername/MyNewsApp.git
cd MyNewsApp
```

### 2. Open in Xcode

```
open MyNewsApp.xcodeproj
```

### 3. Build & Run

Select a simulator or device and hit Run (⌘ + R).

## 🧪 Running Unit Tests
- Select the test scheme from the top bar.
- Press ⌘ + U to run tests.

Unit test is included for:
- NewsService: Network fetching logic
