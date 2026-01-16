
### Install Dependencies
```bash
cd crypto_assessment
flutter pub get
```

### Generate Code (if needed)
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run the App
```bash
# iOS Simulator
flutter run -d ios

# Android Emulator
flutter run -d android

# Chrome (web)
flutter run -d chrome
```

## 3. Testing the App

Once running:
1. The app will automatically load market data from the backend
2. Pull down to refresh
3. Use the search bar to filter cryptocurrencies
4. Tap the sort icon to sort by price or change
5. Tap any item to see detailed information

## Project Structure Overview

```
crypto_assessment/
├── lib/
│   ├── app/                    # App initialization
│   ├── base/                   # Core/shared code
│   │   ├── di/                 # Dependency injection
│   │   ├── networking/         # HTTP client
│   │   ├── domain/            # Base domain layer
│   │   └── data/              # Base data layer
│   └── features/
│       ├── home/              # Home screen
│       └── market_data/       # Market data feature
│           ├── data/          # Data layer (DTOs, repos, sources)
│           ├── domain/        # Domain layer (entities, repos, use cases)
│           └── presentation/  # UI layer (cubits, screens)
└── backend/                   # Node.js backend API
```

## Architecture Highlights

This project follows the **exact same architecture** as odix-pay-mobile:

### 1. Clean Architecture
- **Presentation Layer**: UI (Pages) + State Management (Cubits)
- **Domain Layer**: Business Logic (Entities, Use Cases, Repository Interfaces)
- **Data Layer**: Data Sources (Remote/Local) + Repository Implementations

### 2. Dependency Injection
- Uses `injectable` + `get_it` (same as odix-pay-mobile)
- Modules: `NetworkModule`, `AppModule`
- Auto-generated with `@injectable`, `@lazySingleton`, `@module`

### 3. State Management
- `flutter_bloc` with Cubit pattern
- `freezed` for immutable states
- BlocObserver for logging

### 4. Data Layer Pattern
- DTOs (Data Transfer Objects) separate from Entities
- Extension methods for conversion (`toDomain()`)
- freezed + json_serializable for code generation

### 5. Error Handling
- `Either<Failure, T>` from dartz
- Custom Failure classes
- Centralized in BaseRepository

## Key Files to Review

1. **DI Setup**: `lib/base/di/di_entry_point.dart`
2. **Network Client**: `lib/base/networking/dio_http_client.dart`
3. **Repository Pattern**: `lib/features/market_data/data/repos/market_data_repo_impl.dart`
4. **Use Case**: `lib/features/market_data/domain/use_cases/get_market_data_use_case.dart`
5. **Cubit**: `lib/features/market_data/presentation/blocs/market_data_cubit.dart`
6. **UI**: `lib/features/market_data/presentation/pages/market_data_screen.dart`

## Common Issues

### Backend Connection
If the app can't connect to the backend:
- Make sure backend is running on port 3000
- For Android emulator, you may need to change `localhost` to `10.0.2.2` in `lib/base/di/network_module.dart`

### Code Generation
If you see errors about missing generated files:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Dependencies
If you see package errors:
```bash
flutter clean
flutter pub get
```

## Next Steps

To extend this project:
1. **WebSocket Integration**: Add real-time price updates
2. **Local Caching**: Use Hive for offline support
3. **Unit Tests**: Add tests for use cases and repositories
4. **Widget Tests**: Test UI components
5. **Dark Mode**: Add theme switching
6. **Charts**: Add price charts using fl_chart

## Assessment Completion

### Required Features ✅
- [x] API Integration (Dio HTTP client)
- [x] Data Model (MarketData entity + DTO)
- [x] State Management (MarketDataCubit)
- [x] UI Screen (MarketDataScreen with ListView)
- [x] Code Quality (Clean Architecture, DI, Type Safety)

### Bonus Features ✅
- [x] Pull-to-refresh
- [x] Currency formatting
- [x] Percentage formatting
- [x] Search/filter
- [x] Sort functionality
- [x] Error handling with retry
- [x] Detail view
- [x] Empty states
- [x] Loading states

## Architecture Comparison with odix-pay-mobile

| Aspect | odix-pay-mobile | crypto_assessment |
|--------|----------------|-------------------|
| State Management | flutter_bloc | ✅ flutter_bloc |
| DI | injectable + get_it | ✅ injectable + get_it |
| Code Gen | freezed + json_serializable | ✅ freezed + json_serializable |
| HTTP Client | Dio | ✅ Dio |
| Error Handling | Either + Failures | ✅ Either + Failures |
| Architecture | Clean Architecture | ✅ Clean Architecture |
| Folder Structure | Feature-based | ✅ Feature-based |
| Data Pattern | DTO → Entity | ✅ DTO → Entity |

