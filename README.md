# Wallpaper App
This Wallpaper App is a mobile application built with Flutter, Firebase, and the Pexels API to provide a seamless wallpaper browsing experience. The app allows users to browse, search, and save wallpapers. It also includes user authentication, favorite wallpapers, and local storage for a complete user experience.

## Screens & Features
### 1. Register Page
Functionality: Users can sign up with an email and password, entering basic information. Firebase Authentication is used for managing user credentials.
## 2. Login Page
Functionality: Allows users to log in with email and password. Firebase Authentication is utilized to verify user credentials.
## 3. Home Screen
Wallpapers Display: Shows a grid view of random wallpapers with infinite scrolling, allowing users to browse a large collection.
Data Source: Wallpapers are fetched from the Pexels API.
## 4. Search Screen
Search Functionality: Includes a search input field where users can look up specific wallpapers. Results are fetched from the Pexels API based on the search term.
## 5. Wallpaper Details Screen
Wallpaper View: Selected wallpaper is displayed in full-screen mode.
Download Feature: Users can download the wallpaper to their device’s downloads folder.
Favorites: Users can mark a wallpaper as a favorite, adding it to their Favorite Screen.
## 6. Favorite Screen
Favorite Wallpapers: Displays a collection of wallpapers marked as favorites by the user. Favorite wallpapers are stored locally using the Hive database.
## 7. Logout Feature
Logout: Users can log out of the app, with a confirmation dialog ensuring they do not log out unintentionally.
Session Management: User login status is managed with shared preferences to check if the user is logged in.
## Installation & Setup
### Prerequisites
Flutter SDK 
Firebase account with project configured for email/password authentication
Pexels API key for accessing the wallpaper data
### Instructions
#### Clone the repository:
```
https://github.com/Abdullah-mamdouh/WWALPER.git
```
#### Install dependencies:
```
flutter pub get
```

#### Run the app:
```
flutter run
```
