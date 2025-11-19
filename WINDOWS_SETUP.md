# Windows Setup Guide for iOS Flutter Development

## ⚠️ Important Limitation

**iOS development requires macOS and Xcode**, which are not available on Windows. However, you can still:
- Set up Flutter and Dart on Windows
- Develop and test your app code
- Build for Android/Web/Windows
- Use remote macOS services for iOS builds

## Step 1: Install Flutter SDK on Windows

### Option A: Using Flutter Installer (Recommended)

1. **Download Flutter SDK:**
   - Visit: https://docs.flutter.dev/get-started/install/windows
   - Download the latest Flutter SDK zip file
   - Extract it to a location like `C:\src\flutter` (avoid spaces in path)

2. **Add Flutter to PATH:**
   - Open "Environment Variables" in Windows
   - Add `C:\src\flutter\bin` to your PATH
   - Or use PowerShell (as Administrator):
     ```powershell
     [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\src\flutter\bin", "User")
     ```

3. **Verify Installation:**
   ```powershell
   flutter --version
   flutter doctor
   ```

### Option B: Using Git (Alternative)

```powershell
# Clone Flutter repository
git clone https://github.com/flutter/flutter.git -b stable C:\src\flutter

# Add to PATH (same as above)
```

## Step 2: Install Required Dependencies

### Install Git
- Download from: https://git-scm.com/download/win
- Install with default options

### Install Android Studio (for Android development/testing)
1. Download from: https://developer.android.com/studio
2. Install Android Studio
3. Open Android Studio and install:
   - Android SDK
   - Android SDK Platform-Tools
   - Android Emulator

### Install Visual Studio (for Windows desktop development)
- Download Visual Studio Community: https://visualstudio.microsoft.com/
- Install with "Desktop development with C++" workload

## Step 3: Configure Flutter on Windows

1. **Run Flutter Doctor:**
   ```powershell
   flutter doctor
   ```

2. **Accept Android Licenses:**
   ```powershell
   flutter doctor --android-licenses
   ```

3. **Install Flutter Dependencies:**
   ```powershell
   cd C:\virtacademyv0\ios-app
   flutter pub get
   ```

## Step 4: Options for iOS Development on Windows

Since iOS development requires macOS, here are your options:

> **💡 Have an iPhone?** See [IOS_DEVICE_DEPLOYMENT.md](IOS_DEVICE_DEPLOYMENT.md) for how to install your app on your physical iPhone from Windows.

### Option 1: Remote macOS Machine (Recommended)
- Use a Mac Mini, MacBook, or iMac
- Connect via SSH or remote desktop
- Build iOS apps remotely

### Option 2: Cloud macOS Services
- **MacStadium** - https://www.macstadium.com/
- **AWS EC2 Mac instances** - https://aws.amazon.com/ec2/instance-types/mac/
- **MacinCloud** - https://www.macincloud.com/
- **Codemagic** - CI/CD with macOS build machines

### Option 3: CI/CD Services (Best for Production)
- **Codemagic** - https://codemagic.io/ (Free tier available)
- **AppCircle** - https://appcircle.io/
- **Bitrise** - https://www.bitrise.io/
- **GitHub Actions** (with macOS runners)

### Option 4: macOS Virtual Machine (Not Recommended)
- macOS VMs on Windows violate Apple's license agreement
- Not officially supported
- Performance issues

## Step 5: Development Workflow on Windows

### What You CAN Do on Windows:

1. **Develop Flutter Code:**
   ```powershell
   # Edit code in your IDE
   code .  # If using VS Code
   ```

2. **Test on Android Emulator:**
   ```powershell
   flutter run
   ```

3. **Test on Chrome/Web:**
   ```powershell
   flutter run -d chrome
   ```

4. **Test on Windows Desktop:**
   ```powershell
   flutter run -d windows
   ```

5. **Run Tests:**
   ```powershell
   flutter test
   ```

6. **Analyze Code:**
   ```powershell
   flutter analyze
   ```

### What You CANNOT Do on Windows:

- ❌ Run iOS Simulator
- ❌ Build iOS apps directly
- ❌ Install CocoaPods
- ❌ Use Xcode

## Step 6: Recommended Setup for Windows Users

### Development Setup:
1. **IDE:** Install VS Code with Flutter extension
   ```powershell
   # Install VS Code extensions
   code --install-extension Dart-Code.dart-code
   code --install-extension Dart-Code.flutter
   ```

2. **Version Control:** Use Git (already installed)

3. **Testing:** Use Android Emulator for development

### iOS Build Setup:
1. **Choose a cloud service** (Codemagic recommended for free tier)
2. **Connect your repository** (GitHub/GitLab/Bitbucket)
3. **Configure build settings** in the cloud service
4. **Build iOS apps** automatically on commits/PRs

## Step 7: Quick Start Commands

```powershell
# Navigate to project
cd C:\virtacademyv0\ios-app

# Install dependencies
flutter pub get

# Check Flutter setup
flutter doctor

# Run on Android (if emulator is running)
flutter run

# Build for Android
flutter build apk

# Build for Windows
flutter build windows

# Build for Web
flutter build web
```

## Troubleshooting

### Flutter Doctor Issues:

**Missing Android SDK:**
- Install Android Studio
- Run: `flutter doctor --android-licenses`

**Missing Visual Studio:**
- Install Visual Studio with C++ workload
- Restart terminal

**Git not found:**
- Install Git and add to PATH
- Restart terminal

### Common Errors:

**"flutter: command not found"**
- Add Flutter to PATH
- Restart terminal/PowerShell

**"Unable to find Android SDK"**
- Open Android Studio
- Go to Tools > SDK Manager
- Install Android SDK

## Next Steps

1. ✅ Complete Flutter installation on Windows
2. ✅ Set up Android development environment
3. ✅ Choose iOS build solution (cloud service recommended)
4. ✅ Configure CI/CD for iOS builds
5. ✅ Start developing your app!

## Resources

- [Flutter Windows Installation](https://docs.flutter.dev/get-started/install/windows)
- [Flutter Doctor Explained](https://docs.flutter.dev/get-started/install/windows#run-flutter-doctor)
- [Codemagic CI/CD](https://codemagic.io/)
- [Flutter Development Best Practices](https://docs.flutter.dev/development)


