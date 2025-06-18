# AUVNET Flutter Internship Assessment

A Flutter e-commerce application built with Clean Architecture, BLoC pattern, and Supabase backend integration.

## 📱 App Screenshots

### Splash Screen
<img src="https://github.com/user-attachments/assets/79113540-7212-4e0f-a3a4-6236853442eb" alt="Splash Screen" width="300"/>

### Onboarding
<img src="https://github.com/user-attachments/assets/546f4acf-36c0-4630-af36-ec945c3234b2" alt="Onboarding Screen" width="300"/>

### Authentication
<img src="https://github.com/user-attachments/assets/8313ba42-77c0-4c47-b35f-6f9c4b23c8b7" alt="Login Screen" width="300"/>
<img src="https://github.com/user-attachments/assets/b1b73ce7-fd03-453a-815a-ccacd98f7615" alt="Sign Up Screen" width="300"/>

### Home Screen
<img src="https://github.com/user-attachments/assets/69f32eb0-8a79-42d1-a409-0902a853ccfa" alt="Home Screen 1" width="300"/>
<img src="https://github.com/user-attachments/assets/fcc70805-cbc6-41ed-9e03-e2b47cf4cb0e" alt="Home Screen 2" width="300"/>

## 🏗️ Architecture Overview
<img src="https://github.com/user-attachments/assets/b77c7887-1b85-4577-9805-0d43412af225" alt="Architecture Diagram" width="600"/>

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

### Frontend
- **Flutter**: Cross-platform mobile framework
- **Dart**: Programming language

### State Management
- **flutter_bloc**: BLoC pattern implementation
- **equatable**: Value equality for states and events

### Backend Services
- **Supabase**: Backend-as-a-Service
- **Supabase Auth**: User authentication
- **Supabase Database**: Cloud database

### Local Storage
- **Hive**: Fast, lightweight NoSQL database
- **Secure Storage**: Token and sensitive data storage

### UI Framework
- **flutter_screenutil**: Responsive design
- **google_fonts**: Typography system
- **Custom Theming**: Design system implementation

### Architecture & DI
- **GetIt**: Dependency injection
- **Clean Architecture**: Scalable code organization

## 📋 Prerequisites

- **Flutter SDK**: Version 3.0.0 or higher
- **Dart SDK**: Version 3.0.0 or higher
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
The project is pre-configured with Supabase. To use your own instance:
1. Create a project on [Supabase](https://supabase.com).
2. Update `lib/core/helpers/supabase_helper.dart` with your Supabase URL and anon key:
   ```dart
   Supabase.initialize(
     url: 'YOUR_SUPABASE_URL',
     anonKey: 'YOUR_ANON_KEY',
   );
   ```

### 4. Run the App
```bash
# Debug mode
flutter run

# Release mode
flutter run --release
```

## 🏗️ Architectural Design Rationale

### Clean Architecture Implementation
**Presentation Layer** (`ui/`):
- Contains screens and widgets
- Handles user interactions
- Consumes BLoC states and dispatches events

**Business Logic Layer** (`logic/`):
- BLoC classes for state management
- Event definitions and state definitions
- Business rules and validation logic

**Data Layer** (`data/`):
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
abstract class LoginRepository {
  Future<LoginResponseModel> login(LoginRequestModel request);
}

class LoginRepoImpl implements LoginRepository {
  final SupabaseClient supabaseClient;
  // Implementation details...
}
```

### Dependency Injection
```dart
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nawel/features/auth/login/logic/login_bloc.dart';
import 'package:nawel/features/auth/sign_up/logic/sign_up_bloc.dart';
import 'package:nawel/features/auth/login/data/repo/login_repo.dart';
import 'package:nawel/features/auth/sign_up/data/repo/sign_up_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Core Services
  // Supabase Client - Singleton for backend connectivity
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // Data Layer
  // SignUp Repository - Singleton for sign-up data operations
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(getIt<SupabaseClient>()),
  );
  // Login Repository - Singleton for login data operations
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt<SupabaseClient>()),
  );

  // Presentation Layer
  // SignUp Bloc - Factory for per-screen instances
  getIt.registerFactory<SignUpBloc>(() => SignUpBloc(getIt<SignUpRepo>()));
  // Login Bloc - Factory for per-screen instances
  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt<LoginRepo>()));
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
1. **Splash Screen**: Initializes app and checks authentication
2. **Onboarding**: First-time user introduction (if needed)
3. **Authentication**: Login/Sign up flow
4. **Home Screen**: Main application interface

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

## 📬 Submission
- **Repository**: [AUVNET Flutter Internship Assessment](https://github.com/yourusername/AUVNET-Flutter-Internship-Assessment)
- **Submission Form**: [Google Form](https://forms.gle/Cs8XD8BGYesN1gTu)
- **Contact**: AhmedRoyale@AUVNET.com for inquiries
- **Deadline**: June 18, 2025 (submitted on June 18, 2025)