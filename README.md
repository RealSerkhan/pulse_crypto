# Crypto Assessment - PulseNow Flutter Developer Assessment

A Flutter mobile application displaying cryptocurrency market data with real-time updates, built with **Clean Architecture** principles following the odix-pay-mobile project structure.

## 🏗️ Architecture

This project follows **Clean Architecture** with a clear separation of concerns, inspired by the odix-pay-mobile codebase:

```
lib/
├── app/                          # Application setup
│   ├── app.dart                  # App initialization
│   ├── app_view.dart             # Root widget with theme and providers
│   └── bootstrap.dart            # Bootstrap with error handling
│
├── base/                         # Shared/Core functionality
│   ├── data/repos/               # Base repositories implementation
│   ├── di/                       # Dependency Injection (Injectable + GetIt)
│   ├── domain/                   # Domain layer (errors, models, repos)
│   ├── networking/               # HTTP Client abstraction (Dio)
│   └── presentation/             # Shared UI utilities
│
└── features/                     # Feature modules
    ├── home/                     # Home feature
    └── market_data/              # Market Data feature
        ├── data/                 # DTOs, DataSources, Repo implementations
        ├── domain/               # Entities, Repo interfaces, Use cases
        └── presentation/         # Cubits, States, Pages
```

## 🎯 Key Architectural Patterns

1. **Clean Architecture Layers**: Presentation → Domain ← Data
2. **Dependency Injection**: `injectable` + `get_it` (auto-generated)
3. **State Management**: BLoC pattern with `flutter_bloc` + `freezed`
4. **Error Handling**: `Either<Failure, T>` from `dartz`
5. **Code Generation**: `freezed`, `json_serializable`, `injectable_generator`

## 📦 Tech Stack

- **Flutter** 3.7.2+
- **State Management**: flutter_bloc, bloc
- **DI**: injectable, get_it
- **Networking**: dio
- **Code Gen**: freezed, json_serializable
- **Functional**: dartz
- **UI**: flutter_screenutil, intl

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.7.2+
- Dart SDK 3.7.2+
- Node.js (for backend)

### Setup Instructions

1. **Install Dependencies**
   ```bash
   cd crypto_assessment
   flutter pub get
   ```

2. **Run Code Generation**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. **Start the Backend Server**
   ```bash
   cd ../backend
   npm install
   npm start
   ```
   Backend runs on `http://localhost:3000`

4. **Run the App**
   ```bash
   flutter run
   ```

## ✅ Assessment Requirements

### Required Features ✓
- [x] API Integration with error handling
- [x] MarketData entity with all required fields
- [x] MarketDataCubit for state management  
- [x] Market Data screen with list view
- [x] Clean code following Flutter best practices

### Nice-to-Have Features ✓
- [x] Pull-to-refresh
- [x] Currency & percentage formatting
- [x] Empty state handling
- [x] Error UI with retry
- [x] Search/filter functionality
- [x] Sort by price or change
- [x] Detail view on tap
- [x] Comprehensive error handling
- [x] Code organization with Clean Architecture

## 🏛️ Following odix-pay-mobile Structure

| Aspect | odix-pay-mobile | crypto_assessment |
|--------|----------------|-------------------|
| Architecture | Clean Architecture | ✓ Same |
| DI Framework | injectable + get_it | ✓ Same |
| State Management | flutter_bloc | ✓ Same |
| Code Generation | freezed + json_serializable | ✓ Same |
| Error Handling | dartz Either | ✓ Same |
| HTTP Client | dio with interceptors | ✓ Same |
| Project Structure | feature-based modules | ✓ Same |

## 🔧 Development Commands

```bash
# Generate code (after changes)
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate)
dart run build_runner watch --delete-conflicting-outputs

# Clean build
flutter clean && flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

```
lib/
├── main.dart                           # Application entry point
├── models/
│   └── market_data_model.dart         # Market data model
├── services/
│   └── api_service.dart               # API integration
├── providers/
│   └── market_data_provider.dart      # State management
└── screens/
    ├── home_screen.dart               # Home screen
    └── market_data_screen.dart        # Market data list screen
```

## API Endpoints

- `GET /api/market-data` - Get current market data
- `WebSocket ws://localhost:3000` - Real-time updates

## Technologies Used

- **Flutter** - UI Framework
- **Provider** - State Management
- **HTTP** - REST API calls
- **Material Design** - UI/UX Guidelines
# pulse_crypto
