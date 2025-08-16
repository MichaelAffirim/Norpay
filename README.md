# Norpay - SEVIS Fee Payment Platform

Norpay is a comprehensive iOS payment platform designed specifically for students in Africa and other regions who face challenges accessing Western Union and other traditional payment methods for SEVIS (Student and Exchange Visitor Information System) fee payments.

## 🎯 Mission

Norpay aims to bridge the payment gap for international students by providing a secure, user-friendly platform that enables SEVIS fee payments through alternative payment methods like Mobile Money, which are more accessible in African countries.

## ✨ Features

### 🔐 Authentication
- **User Registration**: Simple sign-up process for new users
- **Secure Login**: Email and password authentication
- **User Profile Management**: Store and manage user information

### 💳 Payment Processing
- **SEVIS Fee Payments**: Complete I-901 SEVIS fee payment processing
- **Multiple Payment Methods**: 
  - Credit Card payments
  - Mobile Money (specifically designed for African markets)
- **Payment Status Tracking**: Real-time payment status updates
- **Payment History**: Complete transaction history and receipts

### 📋 Application Management
- **Multi-step Application Process**: Guided 4-step application flow
- **Form Validation**: Real-time validation of SEVIS information
- **Document Upload**: Support for I-20 and DS-2019 form information
- **Progress Tracking**: Visual progress indicators throughout the process

### 🔍 Status Checking
- **Payment Status Search**: Search payments by SEVIS ID, last name, and date of birth
- **Real-time Updates**: Live status updates for pending payments
- **Payment History**: Comprehensive payment records

### 🎨 User Experience
- **Modern UI/UX**: Clean, intuitive interface designed for mobile-first experience
- **Tailwind-inspired Styling**: Consistent design system with utility-first approach
- **Responsive Design**: Optimized for various iOS device sizes
- **Accessibility**: Built with accessibility best practices

## 🏗️ Architecture

### Technology Stack
- **Framework**: SwiftUI (iOS 15+)
- **Language**: Swift 5.9+
- **Design System**: Custom Tailwind CSS-inspired styling
- **State Management**: MVVM with ObservableObject
- **Data Persistence**: Local storage with UserDefaults (expandable to Core Data)

### Project Structure
```
Norpay/
├── Models/
│   ├── User.swift              # User data model
│   └── Payment.swift           # Payment data model
├── ViewModels/
│   ├── AuthViewModel.swift     # Authentication logic
│   └── PaymentViewModel.swift  # Payment processing logic
├── Views/
│   ├── WelcomeView.swift       # Landing page
│   ├── LoginView.swift         # Authentication screens
│   ├── DashboardView.swift     # Main dashboard
│   ├── ApplicantValidationView.swift # Payment form
│   └── PaymentStatusView.swift # Status checking
├── Utils/
│   └── TailwindStyle.swift     # Design system utilities
├── ContentView.swift           # Main app coordinator
└── NorpayApp.swift            # App entry point
```

## 🚀 Getting Started

### Prerequisites
- Xcode 15.0 or later
- iOS 15.0 or later
- macOS 12.0 or later (for development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/norpay.git
   cd norpay
   ```

2. **Open in Xcode**
   ```bash
   open Norpay.xcodeproj
   ```

3. **Build and Run**
   - Select your target device or simulator
   - Press `Cmd + R` to build and run the app

### Configuration

The app is configured to work out of the box with sample data. For production deployment:

1. **Update API Endpoints**: Replace mock API calls with real backend endpoints
2. **Configure Payment Gateways**: Integrate with actual payment processors
3. **Set Up Push Notifications**: Configure for payment status updates
4. **Add Analytics**: Integrate analytics for user behavior tracking

## 📱 App Screenshots

Here are actual screenshots from the Norpay app showing the complete user experience:

### Welcome Screen
![Welcome Screen](screenshots/Screenshot%202025-07-26%20at%204.32.27%20PM.png)
*Clean, minimalist welcome screen with Norpay branding and call-to-action buttons*

### Login Screen
![Login Screen](screenshots/Screenshot%202025-07-26%20at%204.32.46%20PM.png)
*User authentication screen with email and password fields*

### Main Dashboard
![Main Dashboard](screenshots/Screenshot%202025-07-26%20at%204.34.47%20PM.png)
*Comprehensive dashboard showing SEVIS fee information, payment status search, and recent payments*

### Payment Form (Step 1)
![Payment Form Step 1](screenshots/Screenshot%202025-07-26%20at%204.35.05%20PM.png)
*First step of the payment process with personal information fields*

### iPhone 16 Pro Demo
![iPhone 16 Pro Demo](screenshots/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-07-26%20at%2014.46.00.png)
*Complete app demonstration on iPhone 16 Pro simulator showing the full user interface*

## 🎥 Video Demo

Watch our comprehensive video demo to see Norpay in action:

[![Norpay App Demo](https://img.youtube.com/vi/UZrcCk-QtpI/maxresdefault.jpg)](https://www.youtube.com/watch?v=UZrcCk-QtpI)

### Demo Highlights

**🎯 What You'll See:**
- **Complete User Journey**: From welcome screen to successful payment
- **Multi-step Payment Process**: Guided 4-step SEVIS fee application
- **Real-time Validation**: Form validation and error handling
- **Payment Method Selection**: Credit card and mobile money options
- **Status Tracking**: Payment status search and history
- **Modern UI/UX**: Clean, intuitive interface design

**⏱️ Demo Timeline:**
- **0:00 - 0:30**: App introduction and welcome screen
- **0:30 - 1:30**: User authentication and dashboard overview
- **1:30 - 3:00**: SEVIS fee payment process (Step 1-3)
- **3:00 - 4:00**: Payment method selection and confirmation
- **4:00 - 4:30**: Payment status tracking and history
- **4:30 - 5:00**: Additional features and closing

**🔍 Key Features Demonstrated:**
- ✅ **User Authentication**: Login and registration flow
- ✅ **Dashboard Navigation**: Main app interface and navigation
- ✅ **Form Validation**: Real-time input validation
- ✅ **Payment Processing**: Complete payment workflow
- ✅ **Status Tracking**: Payment status search functionality
- ✅ **Responsive Design**: iOS device compatibility

**📱 Platform Compatibility:**
- iOS 15.0+ devices
- iPhone and iPad support
- Optimized for various screen sizes

> **💡 Pro Tip**: Watch in full screen for the best viewing experience and to see all UI details clearly.

## 📱 App Flow

### 1. Welcome Screen
- App introduction and value proposition
- Call-to-action buttons for login/signup
- Auto-transition to login after 3 seconds

### 2. Authentication
- **Login**: Email and password authentication
- **Sign Up**: New user registration with validation
- **Password Recovery**: (Future enhancement)

### 3. Dashboard
- SEVIS fee payment overview
- Quick status checking
- Recent payment history
- Navigation to payment forms

### 4. Payment Process
- **Step 1**: Personal Information (SEVIS ID, Name, DOB)
- **Step 2**: Academic Information (Form Type, School Code)
- **Step 3**: Contact Information (Email, Citizenship, Birth Country)
- **Step 4**: Payment Method Selection and Confirmation

### 5. Status Tracking
- Search payments by multiple criteria
- View detailed payment information
- Track payment status in real-time

## 🎨 Design System

Norpay uses a custom Tailwind CSS-inspired design system:

### Colors
- **Primary Blue**: `#3366CC` (blue500)
- **Secondary Blue**: `#1E3A8A` (blue800)
- **Background**: `#E6F3FF` (blue50)
- **Text**: `#1F2937` (gray800)
- **Success**: `#10B981` (green)
- **Warning**: `#F59E0B` (yellow)
- **Error**: `#EF4444` (red)

### Typography
- **Headings**: Large, bold fonts for hierarchy
- **Body**: Readable, medium-weight text
- **Captions**: Small, muted text for secondary information

### Components
- **Buttons**: Primary, secondary, and outline variants
- **Cards**: Elevated containers with shadows
- **Forms**: Clean input fields with validation
- **Navigation**: Intuitive tab and stack navigation

## 🔒 Security Features

- **Input Validation**: Real-time form validation
- **Secure Authentication**: Password-based login system
- **Data Encryption**: (Future enhancement for production)
- **Session Management**: Secure user session handling

## 🌍 Localization

The app is designed with internationalization in mind:
- **Multi-language Support**: Ready for localization
- **Currency Handling**: Flexible currency display
- **Regional Payment Methods**: Support for local payment options

## 📊 Future Enhancements

### Phase 2 Features
- [ ] Push notifications for payment updates
- [ ] Document upload and verification
- [ ] Multi-language support (French, Arabic, etc.)
- [ ] Advanced analytics dashboard
- [ ] Admin panel for payment management

### Phase 3 Features
- [ ] Integration with university systems
- [ ] Automated payment reminders
- [ ] Bulk payment processing
- [ ] Advanced reporting and analytics
- [ ] API for third-party integrations

## 🤝 Contributing

We welcome contributions to Norpay! Please read our contributing guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Swift style guidelines
- Write unit tests for new features
- Update documentation for API changes
- Ensure accessibility compliance

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- **website**:  [www.norpay.org](https://norpay.org)
- **Documentation**: [docs.norpay.org](https://norpay.org)
- **Issues**: [GitHub Issues](https://github.com/yourusername/norpay/issues)

## 🙏 Acknowledgments

- **SEVIS**: U.S. Department of Homeland Security
- **SwiftUI**: Apple Inc.
- **Design Inspiration**: Modern payment platforms
- **Community**: Open source contributors and beta testers

---

**Norpay** - Making SEVIS payments accessible to students worldwide. 🌍💳 
