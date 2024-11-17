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

## Support

If you need help with using this project, have any questions, or would like to report an issue, please use one of the following ways to get in touch:

- **Report an Issue**: If you encounter a bug, want to request a feature, or have suggestions, feel free to [open an issue](https://github.comgithub.com/DataTechWizard/Firebase-Flutter-App/issues).
- **Contact Us**: For any general queries or further assistance, you can reach us at [support@ecomanalytica.co.uk](mailto:support@ecomanalytica.co.uk).
- **Community Discussions**: Join the [GitHub Discussions](https://github.com/DataTechWizard/Firebase-Flutter-App/discussions) to connect with other users, ask questions, and share ideas.
- **Contributing**: If you want to contribute to this project, please check out our [Contributing Guide](CONTRIBUTING.md) for more information on how you can get involved.

We value your feedback and appreciate your involvement!

## License

This project is licensed under the [MIT License](LICENSE).
