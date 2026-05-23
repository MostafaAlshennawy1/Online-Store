# 🛒 Online Store

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Dio](https://img.shields.io/badge/Dio-Networking-blueviolet?style=for-the-badge)
![Provider](https://img.shields.io/badge/Provider-State%20Management-success?style=for-the-badge)

A beautifully crafted, modern Flutter application that demonstrates a complete e-commerce product catalog. The app fetches and displays products from an external API, showcasing best practices in state management, networking, and UI design.

## ✨ Features

- **Product Catalog**: Browse a comprehensive list of products fetched dynamically from the DummyJSON API.
- **Category Filtering**: Seamlessly filter products by category to find exactly what you're looking for.
- **Shopping Cart**: Add products to your cart, view the total price, and manage your selected items.
- **Favorites List**: Save your favorite products for quick access later.
- **State Management**: Robust state management using the `Provider` package to ensure a smooth and responsive user experience.
- **Network Handling**: Efficient and reliable HTTP requests handled by the `Dio` package.
- **Data Modeling**: Type-safe JSON-to-Dart object mapping for clean data architecture.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (SDK ^3.10.1)
- **Language**: [Dart](https://dart.dev/)
- **Networking**: [Dio](https://pub.dev/packages/dio) (^5.9.0)
- **State Management**: [Provider](https://pub.dev/packages/provider) (^6.1.2)
- **API**: [DummyJSON](https://dummyjson.com/)

## 📂 Project Structure

```text
lib/
├── main.dart               # Application entry point
├── HomeScreen.dart         # Main product catalog and UI
├── MyCart.dart             # Shopping cart screen
├── FavoriteList.dart       # Favorite products screen
├── Model.dart              # Data models (e.g., Product)
├── Service.dart            # API and networking logic
└── StoreProvider.dart      # Provider for state management
```

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- An IDE (Android Studio, VS Code, or IntelliJ)
- Git installed

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MostafaAlshennawy1/Online-Store.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd Online-Store
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the application:**
   ```bash
   flutter run
   ```

## 📱 Screenshots

*(Add screenshots of your app here to make the README more engaging)*

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](../../issues).

## 📝 License

This project is open-source and available under the [MIT License](LICENSE).