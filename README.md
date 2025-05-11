🛒 ShopMaster - Your Ultimate E-Commerce App

A robust E-commerce application built using Flutter with a Clean Architecture structure, integrating various APIs for authentication, products, categories, favorites, and cart management.

✨ Features

User Authentication: Log in and log out using a dedicated API.

Product Management: Browse products, view details, and add to cart or favorites.

Categories: Display products based on categories fetched from the API.

Favorites & Cart Tabs: Easily access and manage favorite products and cart items.

Clean Architecture: Organized project structure with data, domain, and presentation layers.

🛠️ Technologies Used

Flutter

Clean Architecture (Data, Domain, Presentation layers)

HTTP for API communication

Provider / Bloc for state management

SharedPreferences (for caching user data)

📝 API Endpoints

Authentication: /api/auth

Products: /api/products

Categories: /api/categories

Favorites: /api/favorites

Cart: /api/cart

📦 Project Structure
lib/
├── data/
│   ├── datasources/
│   └── repositories/
├── domain/
│   ├── entities/
│   └── usecases/
├── presentation/
│   ├── screens/
│   └── widgets/
└── main.dart
