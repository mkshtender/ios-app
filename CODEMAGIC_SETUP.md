# Codemagic Setup Guide

This guide will help you set up Codemagic CI/CD for your Flutter iOS app so you can build and deploy from Windows.

## Prerequisites

- A Git repository (GitHub, GitLab, or Bitbucket)
- A Codemagic account (free tier available)
- Your Flutter project pushed to the repository

## Step 1: Create Codemagic Account

1. **Sign up for Codemagic:**
   - Visit: https://codemagic.io/
   - Click "Sign up" or "Get started"
   - Sign up with your GitHub, GitLab, or Bitbucket account

2. **Verify your account:**
   - Check your email for verification
   - Complete the setup process

## Step 2: Add Your App to Codemagic

1. **Add your repository:**
   - In Codemagic dashboard, click "Add application"
   - Select your Git provider (GitHub/GitLab/Bitbucket)
   - Authorize Codemagic to access your repositories
   - Select your `ios-app` repository
   - Click "Finish: Add application"

2. **Codemagic will detect `codemagic.yaml`:**
   - Since you have `codemagic.yaml` in your repository root, Codemagic will automatically use it
   - You'll see the workflow defined in the file

## Step 3: Configure Code Signing (Required for iOS) ⚠️

**This is the most important step!** iOS apps cannot be built without code signing.

### Option A: Automatic Code Signing with Apple ID (Easiest - Free Apple ID)

**Step-by-step instructions:**

1. **Get your App Bundle Identifier:**
   - Open `ios/Runner/Info.plist` in your project
   - Find the `CFBundleIdentifier` value (or check `ios/Runner.xcodeproj`)
   - It should look like: `com.example.iosapp` or `com.yourname.iosapp`
   - **Note this down** - you'll need it

2. **In Codemagic Dashboard:**
   - Go to your app (click on it in the dashboard)
   - Click on **"Code signing"** in the left sidebar
   - You'll see options for iOS code signing

3. **Add Apple ID Credentials:**
   - Click **"Add credentials"** or **"Add Apple ID"**
   - Enter your **Apple ID email** (the one you use for iCloud/App Store)
   - Enter your **Apple ID password**
   - **Important:** If you have 2FA enabled (most accounts do), you need to create an **App-Specific Password**:
     - Go to https://appleid.apple.com/
     - Sign in → Security → App-Specific Passwords
     - Generate a new password for "Codemagic"
     - Use this password instead of your regular password

4. **Add Environment Variables:**
   - Go to **"Teams"** → **"Environment variables"** (or **"Settings"** → **"Environment variables"**)
   - Click **"Add group"** or select your team
   - Add these variables:
     - **Variable name:** `APPLE_ID`
     - **Value:** Your Apple ID email
     - **Variable name:** `APPLE_ID_PASSWORD`
     - **Value:** Your Apple ID password (or app-specific password)
     - **Variable name:** `APP_ID`
     - **Value:** Your app bundle identifier (from step 1, e.g., `com.example.iosapp`)
   - Make sure these are **not** encrypted if you want them visible (or encrypt if you prefer)
   - **Save** the variables

5. **Link Variables to Your App:**
   - Go back to your app settings
   - Go to **"Environment variables"** section
   - Make sure the variables you created are available to your workflow
   - The workflow will automatically use them

**Note:** 
- For free Apple IDs, apps expire after 7 days
- For production, you'll need a paid Apple Developer account ($99/year)
- The first build might take longer as Codemagic sets up certificates

### Option B: Manual Code Signing (Paid Developer Account)

If you have a paid Apple Developer account:

1. **Export certificates and provisioning profiles:**
   - Follow Codemagic's guide: https://docs.codemagic.io/code-signing/ios-code-signing/

2. **Upload to Codemagic:**
   - Go to "Teams" > "Code signing identities"
   - Upload your certificates and provisioning profiles

## Step 4: Update codemagic.yaml (Optional Customization)

The `codemagic.yaml` file is already configured, but you may want to customize:

### Update Email Notifications

Edit `codemagic.yaml` and replace:
```yaml
email:
  recipients:
    - user@example.com  # Replace with your email
```

### Update Build Triggers

By default, builds trigger on:
- Push to any branch
- Pull requests

To customize, edit the `triggering` section:
```yaml
triggering:
  events:
    - push
    - tag  # Add tag triggers
  branch_patterns:
    - pattern: 'main'  # Only build main branch
      include: true
```

### Update Instance Type

The default uses `mac_mini_m2` (Mac Mini M2). This is the default instance type as of September 2024. You can change to:
- `mac_mini_m2` (default, Mac Mini M2 - good performance)
- `mac_pro` (Mac Pro - fastest, paid tier)

## Step 5: Push Your Code

1. **Commit the codemagic.yaml file:**
   ```powershell
   git add codemagic.yaml
   git commit -m "Add Codemagic CI/CD configuration"
   git push
   ```

2. **Codemagic will automatically:**
   - Detect the push
   - Start a build
   - Build your iOS app
   - Generate an .ipa file

## Step 6: Download Your .ipa File

1. **View build status:**
   - Go to Codemagic dashboard
   - Click on your app
   - View the build progress

2. **Download the .ipa:**
   - Once build completes, go to "Artifacts" section
   - Download the `.ipa` file
   - This is the iOS app file you can install on your iPhone

## Step 7: Install on Your iPhone

See [IOS_DEVICE_DEPLOYMENT.md](IOS_DEVICE_DEPLOYMENT.md) for detailed instructions on installing the .ipa file on your iPhone using:
- AltStore (free)
- Sideloadly (free)
- TestFlight (requires paid developer account)

## Workflow Overview

Here's what happens when you push code:

1. **Push to Git** → Codemagic detects the change
2. **Clone repository** → Downloads your code
3. **Install dependencies** → Runs `flutter pub get` and `pod install`
4. **Code signing** → Signs the app with your credentials
5. **Build iOS app** → Creates the .ipa file
6. **Artifacts** → .ipa file is available for download
7. **Email notification** → You receive build status (if configured)

## Troubleshooting

### Build Fails: "Code signing required" or "Failed to set code signing settings"

**Error messages you might see:**
- `Failed to set code signing settings for ios/Runner.xcodeproj`
- `Searching for files matching .../*.mobileprovision` (and finding nothing)
- `List available code signing certificates in keychain` (and finding nothing)

**Solutions (try in order):**

1. **Verify Environment Variables:**
   - Go to Codemagic dashboard → Your app → Environment variables
   - Make sure `APPLE_ID`, `APPLE_ID_PASSWORD`, and `APP_ID` are set
   - Check that `APP_ID` matches your bundle identifier in `ios/Runner/Info.plist`

2. **Check Apple ID Credentials:**
   - Verify your Apple ID email is correct
   - If you have 2FA, use an **App-Specific Password** (not your regular password)
   - Create one at: https://appleid.apple.com/ → Security → App-Specific Passwords

3. **Use Codemagic's Built-in Code Signing:**
   - Go to your app → **"Code signing"** section
   - Click **"Add credentials"** or **"Add Apple ID"**
   - Enter your Apple ID directly in the Code signing section (this is easier than environment variables)
   - Codemagic will handle the rest automatically

4. **Verify Bundle Identifier:**
   - Check `ios/Runner/Info.plist` for `CFBundleIdentifier`
   - Make sure it matches the `APP_ID` environment variable
   - It should be in format: `com.yourname.appname`

5. **Check Build Logs:**
   - Look at the full build log in Codemagic
   - Search for "code signing" errors
   - The logs will show exactly what's missing

6. **Try Manual Code Signing Setup:**
   - If automatic signing keeps failing, you may need to:
     - Get a paid Apple Developer account ($99/year)
     - Export certificates and provisioning profiles manually
     - Upload them to Codemagic
   - See: https://docs.codemagic.io/code-signing/ios-code-signing/

### Build Fails: "CocoaPods error"

**Solution:**
- The `codemagic.yaml` already includes `pod install`
- Check the build logs for specific CocoaPods errors
- Ensure your `Podfile` is correct

### Build Succeeds but No .ipa File

**Solution:**
- Check the "Artifacts" section in build details
- Verify the artifact path in `codemagic.yaml`: `build/ios/ipa/*.ipa`
- Check build logs for any warnings

### "Workflow not found" Error

**Solution:**
- Ensure `codemagic.yaml` is in the repository root
- Check the file name is exactly `codemagic.yaml` (not `codemagic.yml`)
- Verify the YAML syntax is correct

## Advanced Configuration

### Multiple Workflows

You can define multiple workflows in `codemagic.yaml`:

```yaml
workflows:
  ios-debug:
    name: iOS Debug Build
    # ... debug configuration
  
  ios-release:
    name: iOS Release Build
    # ... release configuration
```

### Custom Build Scripts

Add custom scripts before or after the build:

```yaml
scripts:
  - name: Run tests
    script: flutter test
  
  - name: Analyze code
    script: flutter analyze
  
  - name: Build iOS
    script: flutter build ipa
```

### Publishing to TestFlight

Add TestFlight publishing to automatically upload:

```yaml
publishing:
  app_store_connect:
    auth: integration  # Use App Store Connect API key
    submit_to_testflight: true
    beta_groups:
      - group name 1
      - group name 2
```

See: https://docs.codemagic.io/publishing-yaml/distribution/

## Resources

- **Codemagic Documentation:** https://docs.codemagic.io/
- **YAML Configuration:** https://docs.codemagic.io/yaml-basic-configuration/yaml-getting-started/
- **iOS Code Signing:** https://docs.codemagic.io/code-signing/ios-code-signing/
- **Flutter on Codemagic:** https://docs.codemagic.io/getting-started/building-a-flutter-app/

## Next Steps

1. ✅ Set up Codemagic account
2. ✅ Add your repository
3. ✅ Configure code signing
4. ✅ Push your code
5. ✅ Download .ipa file
6. ✅ Install on iPhone (see IOS_DEVICE_DEPLOYMENT.md)

Happy building! 🚀

