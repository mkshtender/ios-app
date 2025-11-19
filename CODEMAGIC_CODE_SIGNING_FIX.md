# Quick Fix: Code Signing Error in Codemagic

## The Error You're Seeing

```
Failed to set code signing settings for ios/Runner.xcodeproj
Searching for files matching .../*.mobileprovision (not found)
List available code signing certificates in keychain (not found)
```

This means **code signing credentials are not configured** in Codemagic.

## ✅ Quick Fix (5 Minutes)

### Method 1: Use Codemagic's Built-in Code Signing (Easiest)

1. **Go to Codemagic Dashboard:**
   - Open your app
   - Click **"Code signing"** in the left sidebar

2. **Add Apple ID:**
   - Click **"Add credentials"** or **"Add Apple ID"**
   - Enter your Apple ID email
   - Enter your Apple ID password
   - **If you have 2FA:** Use an App-Specific Password:
     - Go to https://appleid.apple.com/
     - Security → App-Specific Passwords
     - Generate new password for "Codemagic"
     - Use that password instead

3. **Save and Rebuild:**
   - Click "Save"
   - Go to "Builds" and start a new build
   - The code signing should work now!

### Method 2: Use Environment Variables

If Method 1 doesn't work, use environment variables:

1. **Get Your Bundle Identifier:**
   - The default is usually: `com.example.iosapp` or similar
   - Check your `ios/Runner.xcodeproj` file or Codemagic will auto-detect it

2. **Add Environment Variables in Codemagic:**
   - Go to **"Teams"** → **"Environment variables"**
   - Add these variables:
     ```
     APPLE_ID = your-email@example.com
     APPLE_ID_PASSWORD = your-password-or-app-specific-password
     ```
   - Make sure they're available to your app/workflow

3. **Rebuild:**
   - Start a new build
   - It should work now

## 🔍 Finding Your Bundle Identifier

Your app's bundle identifier is needed for code signing. To find it:

1. **Check in Codemagic:**
   - Codemagic usually auto-detects it from your Xcode project
   - Check the build logs for "Bundle identifier: ..."

2. **Or check your project:**
   - The bundle identifier is in your Xcode project settings
   - Default Flutter apps usually use: `com.example.iosapp` or `com.yourname.iosapp`

## ⚠️ Important Notes

- **Free Apple ID:** Apps expire after 7 days, need to rebuild weekly
- **Paid Developer Account ($99/year):** Apps last 1 year, access to TestFlight
- **2FA Required:** If your Apple ID has 2FA (most do), you MUST use an App-Specific Password
- **First Build:** May take longer as Codemagic sets up certificates

## 🚨 Still Not Working?

1. **Check Build Logs:**
   - Look for specific error messages
   - Search for "code signing" in the logs

2. **Verify Apple ID:**
   - Make sure your Apple ID is correct
   - Try logging into https://appleid.apple.com/ to verify

3. **Try App-Specific Password:**
   - Even if you think 2FA is off, try an app-specific password
   - Create one at: https://appleid.apple.com/ → Security → App-Specific Passwords

4. **Contact Support:**
   - Codemagic has great support
   - Use the chat widget in the dashboard (bottom right)

## 📚 More Help

- **Codemagic Code Signing Docs:** https://docs.codemagic.io/code-signing/ios-code-signing/
- **Full Setup Guide:** See [CODEMAGIC_SETUP.md](CODEMAGIC_SETUP.md)
- **Troubleshooting:** See troubleshooting section in CODEMAGIC_SETUP.md

