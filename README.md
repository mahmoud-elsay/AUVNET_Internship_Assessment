# AUVNET Flutter Internship Assessment

A Flutter e-commerce application built with Clean Architecture, BLoC pattern, and Supabase backend integration.

## 📱 App Screenshots

### Splash Screen
![Splash Screen](screenshots/splash.png)

### Onboarding
![Onboarding](screenshots/onboarding.png)

### Authentication
![Authentication](screenshots/auth.png)

### Home Screen
![Home Screen](screenshots/home.png)

## 🏗️ Architecture Overview

This project implements **Clean Architecture** principles with clear separation of concerns and follows the BLoC pattern for state management.

### 📁 Project Structure

```
lib/
├── core/                          # Core functionality & shared resources
│   ├── di/                        # Dependency Injection setup
│   ├── helpers/                   # Utility functions & extensions
│   ├── network/                   # Network configurations
│   ├── routing/                   # App navigation & routing
│   ├── storage/                   # Local storage & auth services
│   ├── theming/                   # App theme, colors, and styles
│   └── widgets/                   # Reusable UI components
├── features/                      # Feature-based modules
│   ├── auth/                      # Authentication (Login & Sign Up)
│   │   ├── login/
│   │   │   ├── data/             # Models & Repository
│   │   │   ├── logic/            # BLoC (Business Logic)
│   │   │   └── ui/               # Screens & Widgets
│   │   └── sign_up/              # Same structure as login
│   ├── home/                      # Home screen & related features
│   ├── layout/                    # App layout structure
│   ├── onboarding/               # User onboarding flow
│   └── splash/                    # Splash screen
├── main.dart                      # App entry point
└── nawel.dart                     # App configuration
```

### 🎯 Architecture Patterns

- **Clean Architecture**: Separation of data, domain, and presentation layers
- **BLoC Pattern**: State management with flutter_bloc and copyWith approach
- **Repository Pattern**: Data abstraction layer
- **Dependency Injection**: GetIt for service location

## 🚀 Features

### Authentication System
- **Login**: Email/password authentication with Supabase
- **Sign Up**: User registration with validation
- **Session Management**: Secure token storage with Hive
- **Route Guards**: Authentication-based navigation

### User Interface
- **Responsive Design**: Adaptive layouts using ScreenUtil
- **Custom Theming**: Consistent design system
- **Google Fonts**: Modern typography
- **Form Validation**: Input validation with custom regex

### State Management
- **BLoC Pattern**: Predictable state management
- **Immutable States**: copyWith approach for all state mutations
- **Event Handling**: Comprehensive event system
- **State Consistency**: Proper state updates across the app

## 🛠️ Tech Stack

### **Frontend**
- **Flutter** - Cross-platform mobile framework
- **Dart** - Programming language

### **State Management**
- **flutter_bloc** - BLoC pattern implementation
- **equatable** - Value equality for states and events

### **Backend Services**
- **Supabase** - Backend-as-a-Service
- **Supabase Auth** - User authentication
- **Supabase Database** - Cloud database

### **Local Storage**
- **Hive** - Fast, lightweight NoSQL database
- **Secure Storage** - Token and sensitive data storage

### **UI Framework**
- **flutter_screenutil** - Responsive design
- **google_fonts** - Typography system
- **Custom theming** - Design system implementation

### **Architecture & DI**
- **GetIt** - Dependency injection
- **Clean Architecture** - Scalable code organization

## 📋 Prerequisites

- **Flutter SDK** (3.0.0 or higher)
- **Dart SDK** (3.0.0 or higher)
- **Android Studio** or **VS Code** with Flutter extensions
- **Android device/emulator** or **iOS device/simulator**

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/AUVNET-Flutter-Internship-Assessment.git
cd AUVNET-Flutter-Internship-Assessment
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Supabase Configuration
The project is already configured with Supabase. If you need to set up your own instance:

1. Create a project on [Supabase](https://supabase.com)
2. Update the configuration in `lib/core/helpers/supabase_helper.dart`

### 4. Run the App
```bash
# Debug mode
flutter run

# Release mode
flutter run --release
```

## 🏗️ Architectural Design Rationale

### Clean Architecture Implementation

**Presentation Layer** (`ui/`)
- Contains screens and widgets
- Handles user interactions
- Consumes BLoC states and dispatches events

**Business Logic Layer** (`logic/`)
- BLoC classes for state management
- Event definitions and state definitions
- Business rules and validation logic

**Data Layer** (`data/`)
- Repository implementations
- Data models and DTOs
- External data source interactions (Supabase, Hive)

### State Management with BLoC

- **Immutable States**: All states use `copyWith()` for mutations
- **Event-Driven**: Clear separation between user actions and state changes
- **Predictable**: State transitions are explicit and traceable
- **Testable**: Easy to unit test business logic

### Local Storage Strategy

- **Hive Integration**: Fast, efficient local database
- **User Preferences**: Settings and app configuration
- **Authentication Tokens**: Secure storage of sensitive data
- **Offline Caching**: Data persistence for offline functionality

## 🔧 Key Implementation Details

### BLoC Pattern Usage
```dart
// State with copyWith implementation
class LoginState extends Equatable {
  final bool isLoading;
  final String? error;
  
  const LoginState({this.isLoading = false, this.error});
  
  LoginState copyWith({bool? isLoading, String? error}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
```

### Repository Pattern
```dart
// Abstract repository interface
abstract class LoginRepository {
  Future<LoginResponseModel> login(LoginRequestModel request);
}

// Concrete implementation
class LoginRepoImpl implements LoginRepository {
  final SupabaseClient supabaseClient;
  // Implementation details...
}
```

### Dependency Injection
```dart
// Service registration
void setupGetIt() {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt()));
}
```

## 🎨 Design System

### Color Palette
- **Primary Purple**: `#8900FE`
- **Secondary Black**: `#333333`
- **Accent Blue**: `#1877F2`
- **Background White**: `#FFFFFF`
- **Warning Yellow**: `#FFDE59`

### Typography
- **Primary Font**: DM Sans (headings, buttons)
- **Secondary Font**: Mulish (body text)
- **Accent Font**: Rubik (special elements)

### Responsive Design
- **Base Design**: 393x852 (iPhone 14 Pro dimensions)
- **Screen Adaptation**: Automatic scaling with ScreenUtil
- **Flexible Layouts**: Responsive components across devices

## 📱 App Flow

1. **Splash Screen** → Initialize app and check authentication
2. **Onboarding** → First-time user introduction (if needed)
3. **Authentication** → Login/Sign up flow
4. **Home Screen** → Main application interface

## 🧪 Testing

### Run Tests
```bash
flutter test
```

### Test Structure
- **Unit Tests**: Business logic and utilities
- **Widget Tests**: UI component testing
- **Integration Tests**: End-to-end user flows

## 📦 Build for Production

### Android
```bash
# Build APK
flutter build apk --release

# Build App Bundle (Google Play)
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 📄 Project Compliance

This project meets all specified requirements:

✅ **Clean Architecture**: Proper layer separation and dependency rules  
✅ **BLoC Pattern**: flutter_bloc with copyWith state mutations  
✅ **Supabase Integration**: Authentication and cloud database  
✅ **Local Storage**: Hive implementation for caching  
✅ **Responsive UI**: Clean, intuitive interface design  
✅ **Code Quality**: Dart/Flutter best practices with documentation  
✅ **State Management**: Immutable states with equatable handling  

