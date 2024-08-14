# Currency Converter APP 📈💱

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
- [Google Drive](#Google-Drive)
    - [Main Folder](#Main-Folder)
    - [Videos](#videos)
    - [Screenshots](#Screenshots)
- [Project Installation and Setup Guide](#Project-Installation-and-Setup-Guide)
    - [Installation](#Installation)
    - [Prerequisites](#Prerequisites)
    - [Clone the Repository](#Clone-the-Repository)
    - [Setup Configuration Files](#Setup-Configuration-Files)
    - [Running the Application](#Running-the-Application)
    - [Building the Project](#Building-the-Project)
    


## Overview 🌟



**Currency Converter APP** is a Flutter application designed to convert currencies seamlessly. It features a robust architecture using Domain-Driven Design (DDD) and supports multiple environments through Flutter flavors. This README provides a comprehensive overview of the app, including its features, architecture, and development details.

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

## Google Drive 🗂️

### Main Folder 📂
This folder contains the screenshots, videos, and detailed explanations of the app's features.
[Main Folder](https://drive.google.com/drive/folders/1OZ0nV2mlqdCAV5AhlrGPZtW_keSxHI2r?usp=sharing)

### Videos 🎥
Access the videos showcasing the app here: [Videos](https://drive.google.com/drive/folders/1-CM9ODsafMFLtFsIp6GwULVpzEfZ16uF?usp=drive_link)

### Screenshots 📸
View the app screenshots here: [Screenshots](https://drive.google.com/drive/folders/1d-qijtLQt3vxh0K3-2vvUMCmITYECBb8?usp=drive_link)

## Project Installation and Setup Guide ⚙️

### Installation 🛠️

#### Prerequisites 📦

Ensure you have the latest version of Flutter installed. As of [2024/08/14], the latest stable version is:

```bash
Flutter (Channel stable, 3.24.0, on Microsoft Windows [Version 10.0.22631.3958], locale en-US)
```

If you already have Flutter installed, please upgrade it to the latest version by running:

```bash
flutter upgrade
```

If you do not have Flutter installed, follow the official Flutter documentation for installation: [Flutter Installation Guide](https://docs.flutter.dev/get-started/install). This guide provides instructions for all available operating systems.

#### Clone the Repository 📂

To get a copy of this repository, run the following command in your terminal:

```bash
git clone https://github.com/ahmedmahershaaban/currency_converter.git
```

#### Setup Configuration Files ⚙️

Navigate to the project folder. You should see the following structure:

```plaintext
-currency_converter
    -android
    -ios
    -lib
    -config
    -test
```

You need to add a `config` folder. If the folder does not exist, you can:

1. Create an empty folder named `config`.
2. Inside the `config` folder, create three files:
    - `app_config_dev.json`
    - `app_config_qa.json`
    - `app_config_prod.json`

3. Add the following JSON content to each file:

**`app_config_dev.json`**
```json
{
  "countriesFlagBaseAPI": "https://flagcdn.com/",
  "currencyConverterBaseAPI": "https://prepaid.currconv.com/api/v7/",
  "currencyConverterAPIKey": "Register and add your own obtained APIKEY"
}
```

**`app_config_qa.json`**
```json
{
  "countriesFlagBaseAPI": "https://flagcdn.com/",
  "currencyConverterBaseAPI": "https://prepaid.currconv.com/api/v7/",
  "currencyConverterAPIKey": "Register and add your own obtained APIKEY"
}
```

**`app_config_prod.json`**
```json
{
  "countriesFlagBaseAPI": "https://flagcdn.com/",
  "currencyConverterBaseAPI": "https://prepaid.currconv.com/api/v7/",
  "currencyConverterAPIKey": "Register and add your own obtained APIKEY"
}
```

If you need the `config` folder and files, please contact me at [ahmedmaher13579@outlook.com](mailto:ahmedmaher13579@outlook.com), and I will provide them. Alternatively, create the folder and files as described above.

You should end up with the following:

```plaintext
-currency_converter
    -android
    -ios
    -lib
    -config
        -app_config_dev.json
        -app_config_qa.json
        -app_config_prod.json
    -test
```

#### Running the Application 🚀

Open the project folder in your preferred editor. Since this project uses Flutter flavors, the default run command will not work. I've configured the flavors for Android Studio, and the settings should be included in the project. If you are using a different editor or encounter issues, use the following commands in your terminal:

To run the project:

- For production:

```bash
flutter run --flavor prod -t lib/main_prod.dart
```

- For development:

```bash
flutter run --flavor dev -t lib/main_dev.dart
```

- For quality assurance:

```bash
flutter run --flavor qa -t lib/main_qa.dart
```

#### Building the Project 🔨

To build the project, use the following commands:

- For production:

```bash
flutter build apk --flavor prod -t lib/main_prod.dart --release
```

- For development:

```bash
flutter build apk --flavor dev -t lib/main_dev.dart --release
```

- For quality assurance:

```bash
flutter build apk --flavor qa -t lib/main_qa.dart --release
```

If you encounter any issues or errors, please do not hesitate to contact me at [ahmedmaher13579@outlook.com](mailto:ahmedmaher13579@outlook.com).



