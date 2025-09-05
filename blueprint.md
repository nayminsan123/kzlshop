# Project Blueprint

## Overview

This document outlines the architecture, features, and design of the Flutter application. It serves as a single source of truth for the project's current state and future development plans. This application is an Android version of the kzlshop.web.app, using the same Firebase backend.

## Implemented Features

### Version 1.5

*   **User Authentication:** Implemented email and password authentication using Firebase Auth.
*   **Login/Signup Screens:** Created dedicated screens for user login and registration with a modern, user-friendly interface.
*   **Auth Flow:** The app now starts with a login screen. Upon successful authentication, the user is redirected to the home screen. The app keeps the user logged in across sessions.
*   **Dependencies:** Added the `firebase_auth` package to handle authentication.

### Version 1.4

*   **Product Detail Screen:** Created a new `ProductDetailScreen` that displays detailed information about a selected product, including a larger image, name, price, and full description.
*   **Navigation to Details:** Implemented navigation from both the `ProductScreen` and `CategoryProductScreen`. Tapping on a product card now navigates the user to the corresponding detail screen.
*   **Add to Cart Button:** The `ProductDetailScreen` includes a prominent "Add to Cart" button. The functionality for this button is ready to be implemented.

### Version 1.3

*   **Error Handling:** Added robust error handling for image loading across the `ProductScreen` and `CategoryProductScreen`. The app now displays a placeholder icon if an image URL is invalid or missing, preventing crashes.
*   **Data Validation:** Implemented checks for null or missing product data (name, price, and imageUrl) to ensure the app remains stable even with incomplete database entries.
*   **UI Resilience:** The UI now gracefully handles missing information by displaying default text (e.g., 'No Name', '\$0.00') for products with incomplete data.

### Version 1.2

*   **Category Product Screen:** Created a new screen (`CategoryProductScreen`) to display products belonging to a specific category.
*   **Navigation to Category Products:** Implemented navigation from the `CategoryScreen` to the `CategoryProductScreen`, passing the selected category's ID and name.
*   **Firestore Query for Category Products:** The `CategoryProductScreen` fetches and displays products from the `products` collection in Firestore, filtered by the `categoryId`.

### Version 1.1

*   **Category Screen Implementation:** The `CategoryScreen` now fetches and displays a list of product categories from the `categories` collection in Firestore.
*   **UI for Categories:** Categories are displayed as a list of tappable cards, each showing the category name.

### Version 1.0

*   **Firebase Integration:** The application is connected to a Firebase project (`kzlshop`) to support backend services.
*   **Android Configuration:** The project is specifically configured for Android APK development.
*   **Core Dependencies:** Added `cloud_firestore` for database access, `provider` for state management, and `google_fonts` for custom typography.
*   **Application Structure:** Created a multi-screen structure:
    *   `HomeScreen`: The main entry point with a bottom navigation bar to switch between products and categories.
    *   `ProductScreen`: Displays products from the `products` collection in Firestore in a a grid view.
    *   `CategoryScreen`: A placeholder screen for future category implementation.
*   **Basic Theming:** Implemented a site-wide theme using `ThemeData` with an `amber` primary swatch and the `lato` font from `google_fonts`.
*   **State Management:** Integrated the `provider` package and set up a basic `ThemeProvider` for managing the application's theme.

## Current Plan

*   **Add Search Functionality:** Implement a search bar to allow users to find specific products.
*   **Enhance UI/UX:** Further refine the visual design, add animations, and improve the overall user experience.
