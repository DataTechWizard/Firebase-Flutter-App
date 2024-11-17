# Firebase Flutter App

A Flutter application demonstrating integration with Firebase Analytics and various service features, using Dependency Injection for clean architecture and enhanced maintainability.

## Project Overview

This app serves as a demonstration project, showcasing:

- Integration of Firebase Analytics for e-commerce events.
- Implementation of Dependency Injection using `get_it` and `injectable` packages.
- Clean architecture principles with organized service layers and reusable utilities.

## Project Structure

```
lib
├── data
│   └── products.json
├── di
│   ├── injection.config.dart
│   └── injection.dart
├── features
│   └── other_feature
├── main.dart
├── models
│   └── product_model.dart
├── screens
│   ├── main_screen
│   │   └── ui
│   └── plp
│       └── ui
├── services
│   ├── firebase
│   │   ├── ga_ecom_analytics_events.dart
│   │   ├── ga_error_analytics_events.dart
│   │   ├── ga_journey_analytics_events.dart
│   │   ├── ga_screen_analytics_events.dart
│   │   ├── ga_user_analytics_events.dart
│   │   └── index.dart
│   ├── firebase_event_handler_service.dart
│   ├── product_service_api.dart
│   └── product_service_file_local.dart
└── utils
    ├── random_product_service.dart
    └── random_transactionId.dart
```

## Key Features

- **Firebase Analytics Integration**: Tracks various e-commerce events, screen views, and user actions.
- **Dependency Injection**: Uses `get_it` and `injectable` for dependency injection, simplifying testing and service management.
- **Random Product Service**: Fetches products from a local file for testing purposes.
- **Clean Code Organization**: Follows best practices with separated concerns for services, models, and UI components.

## Setup and Installation

1. Ensure you have Flutter installed: [Flutter installation guide](https://docs.flutter.dev/get-started/install).
2. Clone this repository.
3. Run `flutter pub get` to fetch dependencies.
4. Generate injection files using:
   ```
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. Run the app:
   ```
   flutter run
   ```

## Usage

- **Event Buttons Widget**: Provides a UI to trigger different Firebase Analytics events for testing purposes.
- **Product List Page**: Demonstrates fetching and displaying products, with analytics events for product selection.

## Contribution

Feel free to open issues or submit PRs to enhance this project.

## License

This project is licensed under the [MIT License](LICENSE).
