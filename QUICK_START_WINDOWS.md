# Quick Start Guide - Windows

## 🚀 Fastest Way to Get Started

### Step 1: Install Flutter (if not already installed)

1. **Download Flutter:**
   - Go to: https://docs.flutter.dev/get-started/install/windows
   - Download the Flutter SDK zip file

2. **Extract and Add to PATH:**
   ```powershell
   # Extract to C:\src\flutter (or any path without spaces)
   # Then add to PATH using PowerShell (as Administrator):
   [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\src\flutter\bin", "User")
   ```

3. **Restart PowerShell** and verify:
   ```powershell
   flutter --version
   ```

### Step 2: Run Setup Script

In PowerShell, navigate to your project and run:

```powershell
cd C:\virtacademyv0\ios-app
.\setup_windows.ps1
```

This will:
- ✅ Check Flutter installation
- ✅ Check Git installation
- ✅ Install project dependencies
- ✅ Show Flutter doctor status

### Step 3: Install Additional Tools (Optional but Recommended)

#### For Android Development:
1. Download Android Studio: https://developer.android.com/studio
2. Install Android SDK through Android Studio
3. Accept licenses:
   ```powershell
   flutter doctor --android-licenses
   ```

#### For Windows Desktop Development:
1. Install Visual Studio Community: https://visualstudio.microsoft.com/
2. Select "Desktop development with C++" workload

### Step 4: Verify Everything Works

```powershell
# Check Flutter setup
flutter doctor

# Install dependencies
flutter pub get

# Test on Chrome (if Chrome is installed)
flutter run -d chrome

# Or test on Windows desktop (if Visual Studio is installed)
flutter run -d windows
```

## 📱 iOS Development Options

Since you're on Windows, you have these options for iOS:

> **💡 Have an iPhone?** See [IOS_DEVICE_DEPLOYMENT.md](IOS_DEVICE_DEPLOYMENT.md) for detailed instructions on installing your app on your physical iPhone.

### Quick Options:

### Option 1: Codemagic (Recommended - Free Tier)
1. Sign up at: https://codemagic.io/
2. Connect your Git repository
3. Configure iOS build settings
4. Build iOS apps automatically on commits

### Option 2: Remote Mac
- Use a Mac Mini, MacBook, or iMac
- Connect via SSH
- Build iOS apps remotely

### Option 3: Cloud Mac Services
- MacStadium
- AWS EC2 Mac instances
- MacinCloud

## 🎯 What You Can Do Right Now

Even without iOS, you can:
- ✅ Write and test Flutter code
- ✅ Run on Android emulator
- ✅ Run on Chrome/Web
- ✅ Run on Windows desktop
- ✅ Write unit tests
- ✅ Use hot reload

## 📚 Next Steps

1. Read [WINDOWS_SETUP.md](WINDOWS_SETUP.md) for detailed instructions
2. Set up a CI/CD service for iOS builds
3. Start developing your app!

## ❓ Troubleshooting

**"flutter: command not found"**
- Add Flutter to PATH
- Restart PowerShell

**"Unable to find Android SDK"**
- Install Android Studio
- Open Android Studio > Tools > SDK Manager

**Need help?**
- Check [WINDOWS_SETUP.md](WINDOWS_SETUP.md) for detailed troubleshooting
- Visit: https://docs.flutter.dev/get-started/install/windows


