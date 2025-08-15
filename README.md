# Vangti Chai 💰

A smart Bangladeshi Taka change calculator app built with Flutter.

## 🚀 Features

- **Smart Change Calculation**: Instantly calculates the optimal breakdown of any amount into Bangladeshi currency denominations
- **Intuitive Keypad**: Easy-to-use numeric keypad for amount input
- **Real-time Results**: See the breakdown update as you type
- **Responsive Design**: Optimized layouts for both portrait and landscape orientations
- **Beautiful UI**: Modern design with rounded buttons and attractive blue background

## 💵 Supported Denominations

The app calculates change using all Bangladeshi Taka denominations:
- 500 Taka notes
- 100 Taka notes
- 50 Taka notes
- 20 Taka notes
- 10 Taka notes/coins
- 5 Taka coins
- 2 Taka coins
- 1 Taka coins

## �️ Setup & Installation (Windows)

### Prerequisites
1. **Flutter SDK** (3.8.1 or higher)
2. **Git** for version control
3. **Android Studio** (for Android development)
4. **Visual Studio Code** (recommended IDE)

### Step-by-Step Installation

#### 1. Install Flutter SDK
```bash
# Download Flutter SDK from https://flutter.dev/docs/get-started/install/windows
# Extract to C:\flutter (or your preferred location)
# Add C:\flutter\bin to your PATH environment variable
```

#### 2. Verify Installation
```bash
flutter doctor
```
This command checks your environment and displays a report of Flutter installation status.

#### 3. Install Android Studio
- Download from https://developer.android.com/studio
- Install Android SDK and Android SDK Command-line Tools
- Set up an Android emulator or connect a physical device

#### 4. Clone and Setup Project
```bash
# Clone the repository
git clone <repository-url>
cd vangti-chai

# Install dependencies
flutter pub get

# Check for any issues
flutter doctor
```

#### 5. Run the Project
```bash
# List available devices
flutter devices

# Run on connected device/emulator
flutter run

# Run on specific platform
flutter run -d chrome          # Web browser
flutter run -d windows         # Windows desktop
flutter run -d android         # Android device/emulator
```

#### 6. Build for Production
```bash
# Build APK for Android
flutter build apk

# Build for Windows
flutter build windows

# Build for Web
flutter build web
```

### Troubleshooting
- If `flutter doctor` shows issues, follow the suggested solutions
- Ensure Android SDK is properly installed and configured
- For Windows development, Visual Studio 2022 with C++ tools may be required
- Enable Developer Mode on Windows for desktop development

## �📱 How to Use

1. **Enter Amount**: Use the numeric keypad to input the desired amount in Taka
2. **View Breakdown**: The app automatically shows how many of each denomination you need
3. **Clear & Restart**: Press "CLEAR" to reset and enter a new amount
4. **Rotate Device**: The app adapts beautifully to both portrait and landscape modes


