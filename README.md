# iOS App - Flutter Project

A Flutter project for iOS app development using Dart.

## ⚠️ Windows Users

**If you're on Windows**, see **[WINDOWS_SETUP.md](WINDOWS_SETUP.md)** for detailed Windows-specific setup instructions. iOS development requires macOS, but you can still develop on Windows and use cloud services for iOS builds.

## Prerequisites

### For macOS Users:
1. **Flutter SDK** - [Install Flutter](https://flutter.dev/docs/get-started/install)
2. **Xcode** - Required for iOS development (macOS only)
3. **CocoaPods** - Dependency manager for iOS projects
4. **Dart SDK** - Included with Flutter

### For Windows Users:
1. **Flutter SDK** - [Install Flutter](https://docs.flutter.dev/get-started/install/windows)
2. **Git** - [Download Git](https://git-scm.com/download/win)
3. **Android Studio** (optional, for Android testing)
4. **Cloud macOS Service** (for iOS builds) - See WINDOWS_SETUP.md

## Getting Started

### Windows Users - Quick Setup

Run the setup script:
```powershell
.\setup_windows.ps1
```

Or follow the manual steps in [WINDOWS_SETUP.md](WINDOWS_SETUP.md)

### macOS Users - Standard Setup

### 1. Verify Flutter Installation

```bash
flutter doctor
```

This will check your environment and display a report of the status of your Flutter installation.

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. iOS Setup (macOS only)

Navigate to the iOS directory and install CocoaPods dependencies:

```bash
cd ios
pod install
cd ..
```

**Note:** CocoaPods requires macOS. Windows users should use cloud services for iOS builds (see WINDOWS_SETUP.md).

### 4. Run the App

To run the app on an iOS simulator or device:

```bash
flutter run
```

Or specify iOS explicitly:

```bash
flutter run -d ios
```

## Project Structure

```
ios-app/
├── lib/
│   └── main.dart          # Main application entry point
├── ios/                   # iOS-specific files
│   ├── Runner/           # iOS app configuration
│   ├── Flutter/          # Flutter iOS integration
│   └── Podfile          # CocoaPods dependencies
├── pubspec.yaml          # Flutter project dependencies
└── analysis_options.yaml # Dart/Flutter linting rules
```

## Development

- Edit `lib/main.dart` to modify the app
- Add dependencies in `pubspec.yaml`
- Run `flutter pub get` after adding dependencies
- Use `flutter analyze` to check for issues
- Use `flutter test` to run tests

## Building for iOS

### Debug Build

```bash
flutter build ios --debug
```

### Release Build

```bash
flutter build ios --release
```

## Important Notes

- **iOS development requires macOS and Xcode** - Not available on Windows
- **Windows users:** See [WINDOWS_SETUP.md](WINDOWS_SETUP.md) for development options
- You need an Apple Developer account to deploy to physical devices
- The minimum iOS version is set to 12.0 in the Podfile
- Make sure to configure your bundle identifier in Xcode before building
- If you encounter issues with the Xcode project, Flutter will automatically generate missing project files when you run `flutter pub get` or `flutter run`

## Windows Development

On Windows, you can:
- ✅ Develop Flutter/Dart code
- ✅ Test on Android emulator
- ✅ Test on Chrome/Web
- ✅ Test on Windows desktop
- ❌ Cannot build iOS apps directly (requires macOS)

For iOS builds on Windows, use:
- Cloud CI/CD services (Codemagic, AppCircle, Bitrise)
- Remote macOS machines
- See [WINDOWS_SETUP.md](WINDOWS_SETUP.md) for details

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [iOS App Development Guide](https://flutter.dev/docs/deployment/ios)
- [Codemagic Setup Guide](CODEMAGIC_SETUP.md) - How to set up CI/CD for iOS builds
- [Code Signing Quick Fix](CODEMAGIC_CODE_SIGNING_FIX.md) - Fix code signing errors quickly
- [iOS Device Deployment](IOS_DEVICE_DEPLOYMENT.md) - Installing apps on your iPhone

