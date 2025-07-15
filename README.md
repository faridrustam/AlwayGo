# AlwayGo

AlwayGo is a Swift-based iOS application designed to provide an e-commerce experience, allowing users to browse products, manage a shopping cart, place orders, and handle user authentication securely.

## Features

- **Product Catalog**: Fetch and display a list of products from a remote API.
- **Category Browsing**: Organize products by categories for easier navigation.
- **Cart Management**: Add, remove, and update products in the shopping cart.
- **Order Processing**: Place orders and view order history.
- **Favorites**: Mark and save favorite products locally.
- **User Authentication**: Register and authenticate users, with secure credential storage using Keychain.
- **Persistent Storage**: Save cart and favorite data locally using Codable and FileManager.
- **Networking**: Uses Alamofire for API requests with secure token handling.
- **MVVM Architecture**: Structured for maintainability and scalability.

## Project Structure

- `Models/`: Data models for products, carts, orders, categories, and favorites.
- `Networking/`: All network-related code, including API helpers and managers.
- `Managers/`: Helpers for file management and secure credential storage.
- `Protocols/`: Use-case protocols for modular design.
- `Screen/`: UI controllers for Home, Cart, and other screens.
- `Helper/`: Base controller and utility UI code.

## Usage

- Launch the app to browse products.
- Use the search function or browse by categories.
- Add products to your cart and proceed to checkout.
- Mark products as favorites for quick access.

## Architecture

- **MVVM**: ViewModels manage business logic and state, while Controllers handle UI updates.
- **Networking**: All API interactions are centralized in `NetworkManager` and related classes.
- **Persistence**: Cart and favorites are stored using Codable models and read/written with `FileManagerHelper`.

## Security

- User credentials and tokens are securely stored using iOS Keychain via `KeychainManager`.
