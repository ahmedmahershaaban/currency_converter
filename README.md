# CurrencyConverter 📈💱

## Table of Contents 📑

- [Overview](#overview)
    - [Note](#note)
- [Features](#features)
- [Architecture](#architecture)
    - [Domain-Driven Design (DDD)](#domain-driven-design-ddd)
    - [Presentation Enhancement and Performance](#presentation-enhancement-and-performance)
    - [Code Generation](#code-generation)
    - [Flutter Flavors](#flutter-flavors)
- [Implementation Details](#implementation-details)
    - [Image Loading](#image-loading)
    - [Database Management](#database-management)
    - [API Integration](#api-integration)
    - [Unit Testing](#unit-testing)
    - [Feature Implementations](#feature-implementations)
    - [Figma Design](#figma-design)
- [Installation and Running](#installation-and-running)
- [Screenshots](#screenshots)
- [Video](#video)
- [Postman](#postman)
- [License](#license)

## Overview 🌟

**CurrencyConverter** is a Flutter application designed to convert currencies seamlessly. It features a robust architecture using Domain-Driven Design (DDD) and supports multiple environments through Flutter flavors. This README provides a comprehensive overview of the app, including its features, architecture, and development details.

### Note 📝

When you open the application for the first time, it may take some time to load the details. This is because the app needs to download approximately 250 SVG flag images. This initial load time was discovered during the release mode testing, and while it may appear slow, the application is functioning correctly. Future enhancements will focus on improving this loading time. Please be assured that the application is not broken; it just requires a bit of time to load the data.

## Features 🚀

- **Supported Currencies**: Displays a list of currencies with country flags. Data is cached locally after the first API request to optimize performance on subsequent app launches.
- **Historical Data**: Provides historical exchange rate data for selected currencies for the past seven days.
- **Currency Converter**: Allows users to convert amounts between different currencies.

## Architecture 🏛️

### Domain-Driven Design (DDD) 💡

The application is built using Domain-Driven Design (DDD) to ensure a clean and maintainable codebase:

- **Best Practices**: Incorporates SOLID principles and best practices for a scalable and maintainable architecture.
- **Domain Layer**:
    - **Value Validators**: Used for validating domain values to ensure data integrity.
- **Infrastructure Layer**:
    - **Data Transfer Objects (DTOs)**: Facilitates the transfer of data between different layers of the application.
    - **Data Access Objects (DAOs)**: Manages the separation of models and handles data access operations.

### Presentation Enhancement and Performance ⚙️

- **Folder Structure**: Organizes each screen in its own folder with a subfolder for components, ensuring a clean and maintainable codebase.
- **Routing**: Managed using the `auto_route` package for efficient navigation and route handling.
- **Pixel Perfection**: Achieved with the `screenutil` package to ensure UI elements are displayed accurately across different devices.
- **Package Refactoring**:
    - Refactored `snackbar` and `fl_chart` packages to retain only essential functionalities, reducing app size and enhancing performance.
    - Utilized `fl_chart`’s `LineChart` for UI notifications, reducing package overhead and focusing on specific needs.

### Code Generation 🔄

To streamline development and maintain a clean codebase, the following tools were used for code generation:

- **Freeze Annotation**: For immutable data classes and efficient value management.
- **Auto-Route** and **Auto-Route Generator**: For routing and navigation.
- **GetIt** and **Injectable**: For dependency injection.
- **JSON Annotation** and **JSON Serializable**: For automatic JSON serialization and deserialization.
- **Drift** and **Drift-Flutter**: For local database management and code generation.
- **Chopper** and **Drift-Chopper Generator**: For API interactions and local database integration.
- **Build-Runner**: For managing code generation tasks.

### Flutter Flavors 🍭

Flutter flavors are used to manage multiple environments with a single codebase:

- **Environments**: Configured for production, development, and QA testing.
- **Configuration**: Includes API keys and base URLs specific to each environment.
- **Icons**: Generated for each environment using the `flutter_launcher_icon` package to distinguish between different builds.

## Implementation Details 🔧

### Image Loading 🖼️

- **SVG Handling**: Used the `flutter_svg` package to load SVG images efficiently, as SVGs are smaller in size compared to PNGs and provide high-resolution visuals.
- **Flag Images**: Retrieved from the FLAG-CBN API, stored locally after the initial fetch to improve app performance.

### Database Management 💾

- **Drift**: Employed Drift for SQLite database management, leveraging code generation for simplicity and reducing boilerplate code.
    - **Advantages**: Easy to use, enhances code maintainability, and reduces boilerplate code.

### API Integration 🌐

- **Chopper**: Used for API requests, with converters and interceptors for efficient and clean API handling.
- **Postman**: Utilized Postman to test and validate API endpoints before integration, ensuring reliable backend functionality.

### Unit Testing 🧪

- **Testing Frameworks**:
    - **Mocktail**: Used for mocking dependencies in unit tests.
    - **Bloc Test**: Applied for testing Bloc states and events.
    - **Flutter Test**: Utilized for widget and integration testing.
- **Coverage**:
    - **Domain Layer**: Unit testing for use cases.
    - **Application Layer**: Tested Bloc events and UI interactions.
    - **Infrastructure Layer**: Tested data sources, services, and models.
    - **Fixers Folder**: Included raw data and models to facilitate easier testing.
- **Future Improvements**: Further refactoring and edge case coverage are planned as time permits.

### Feature Implementations 🛠️

- **Internet Connection Check**: Implemented to notify users of connectivity issues with a popup message.
- **Dark Mode**: Added support for dark mode with some UI modifications pending.

### Figma Design 🎨

- **Design Reference**: Imported and adapted a Figma design from the community. Updated the design for pixel-perfect accuracy in the app. Some UI details were adjusted due to incomplete color schemes and theme information in the Figma file.

## Installation and Running 🛠️

To set up and run the project locally:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/CurrencyConverter.git
