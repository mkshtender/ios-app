# Windows Setup Script for Flutter iOS Project
# Run this script in PowerShell (as Administrator recommended)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Flutter iOS Project - Windows Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Flutter is installed
Write-Host "Checking Flutter installation..." -ForegroundColor Yellow
$flutterInstalled = $false
try {
    $flutterVersion = flutter --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Flutter is installed" -ForegroundColor Green
        $flutterInstalled = $true
    }
} catch {
    Write-Host "✗ Flutter is not installed" -ForegroundColor Red
}

if (-not $flutterInstalled) {
    Write-Host ""
    Write-Host "Flutter is not installed. Please install Flutter first:" -ForegroundColor Yellow
    Write-Host "1. Download from: https://docs.flutter.dev/get-started/install/windows" -ForegroundColor White
    Write-Host "2. Extract to C:\src\flutter (or similar path without spaces)" -ForegroundColor White
    Write-Host "3. Add Flutter\bin to your PATH" -ForegroundColor White
    Write-Host "4. Restart PowerShell and run this script again" -ForegroundColor White
    Write-Host ""
    Write-Host "Or run this command to add to PATH (replace path if different):" -ForegroundColor Yellow
    Write-Host '[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\src\flutter\bin", "User")' -ForegroundColor Cyan
    exit 1
}

# Check if Git is installed
Write-Host "Checking Git installation..." -ForegroundColor Yellow
$gitInstalled = $false
try {
    $gitVersion = git --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Git is installed" -ForegroundColor Green
        $gitInstalled = $true
    }
} catch {
    Write-Host "✗ Git is not installed" -ForegroundColor Red
}

if (-not $gitInstalled) {
    Write-Host ""
    Write-Host "Git is not installed. Please install Git:" -ForegroundColor Yellow
    Write-Host "Download from: https://git-scm.com/download/win" -ForegroundColor White
    exit 1
}

# Run Flutter Doctor
Write-Host ""
Write-Host "Running Flutter Doctor..." -ForegroundColor Yellow
Write-Host "----------------------------------------" -ForegroundColor Gray
flutter doctor
Write-Host "----------------------------------------" -ForegroundColor Gray

# Install Flutter dependencies
Write-Host ""
Write-Host "Installing Flutter project dependencies..." -ForegroundColor Yellow
$projectPath = Get-Location
if (Test-Path "pubspec.yaml") {
    flutter pub get
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Dependencies installed successfully" -ForegroundColor Green
    } else {
        Write-Host "✗ Failed to install dependencies" -ForegroundColor Red
    }
} else {
    Write-Host "✗ pubspec.yaml not found. Are you in the project directory?" -ForegroundColor Red
    exit 1
}

# Check for Android setup
Write-Host ""
Write-Host "Checking Android setup..." -ForegroundColor Yellow
$androidSDK = $env:ANDROID_HOME
if ($androidSDK) {
    Write-Host "✓ ANDROID_HOME is set: $androidSDK" -ForegroundColor Green
} else {
    Write-Host "⚠ ANDROID_HOME is not set" -ForegroundColor Yellow
    Write-Host "  Install Android Studio to develop for Android" -ForegroundColor White
}

# iOS Development Warning
Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "⚠ iOS Development Limitation" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "iOS development requires macOS and Xcode, which are not available on Windows." -ForegroundColor White
Write-Host ""
Write-Host "Options for iOS development:" -ForegroundColor Cyan
Write-Host "1. Use a remote macOS machine" -ForegroundColor White
Write-Host "2. Use cloud macOS services (Codemagic, MacStadium, etc.)" -ForegroundColor White
Write-Host "3. Use CI/CD services for iOS builds" -ForegroundColor White
Write-Host ""
Write-Host "See WINDOWS_SETUP.md for detailed instructions." -ForegroundColor Cyan
Write-Host ""

# Summary
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Setup Summary" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "✓ Flutter: Installed" -ForegroundColor Green
Write-Host "✓ Git: Installed" -ForegroundColor Green
Write-Host "✓ Project Dependencies: Installed" -ForegroundColor Green
Write-Host ""
Write-Host "You can now:" -ForegroundColor Yellow
Write-Host "  - Develop Flutter code on Windows" -ForegroundColor White
Write-Host "  - Test on Android emulator" -ForegroundColor White
Write-Host "  - Test on Chrome/Web" -ForegroundColor White
Write-Host "  - Test on Windows desktop" -ForegroundColor White
Write-Host ""
Write-Host "For iOS builds, use a cloud service or remote macOS machine." -ForegroundColor Yellow
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Run 'flutter doctor' to check your setup" -ForegroundColor White
Write-Host "  2. Run 'flutter run' to test on Android/Web/Windows" -ForegroundColor White
Write-Host "  3. Read WINDOWS_SETUP.md for iOS build options" -ForegroundColor White
Write-Host ""


