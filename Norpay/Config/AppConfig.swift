import Foundation

struct AppConfig {
    // MARK: - App Information
    static let appName = "Norpay"
    static let appVersion = "1.0.0"
    static let buildNumber = "1"
    
    // MARK: - SEVIS Fee Configuration
    static let sevisFeeAmount: Double = 350.0
    static let processingFee: Double = 35.0
    static let totalAmount: Double = sevisFeeAmount + processingFee
    
    // MARK: - API Configuration (for future use)
    static let baseURL = "https://api.norpay.com"
    static let apiVersion = "v1"
    
    // MARK: - Payment Configuration
    static let supportedPaymentMethods = [
        PaymentMethod.creditCard,
        PaymentMethod.mobileMoney
    ]
    
    // MARK: - Form Types
    static let supportedFormTypes = ["F-1", "J-1", "M-1"]
    
    // MARK: - Countries (African countries first, then others)
    static let supportedCountries = [
        // East Africa
        "Kenya", "Uganda", "Tanzania", "Rwanda", "Burundi", "Ethiopia", "Somalia", "Djibouti", "Eritrea", "South Sudan",
        // West Africa
        "Nigeria", "Ghana", "Senegal", "Côte d'Ivoire", "Burkina Faso", "Mali", "Niger", "Chad", "Cameroon", "Central African Republic",
        "Gabon", "Equatorial Guinea", "São Tomé and Príncipe", "Benin", "Togo", "Sierra Leone", "Liberia", "Guinea", "Guinea-Bissau",
        "The Gambia", "Cape Verde", "Mauritania",
        // Southern Africa
        "South Africa", "Namibia", "Botswana", "Zimbabwe", "Zambia", "Malawi", "Mozambique", "Angola", "Lesotho", "Eswatini",
        "Madagascar", "Mauritius", "Seychelles", "Comoros",
        // North Africa
        "Morocco", "Algeria", "Tunisia", "Libya", "Egypt", "Sudan",
        // Other regions
        "United States", "Canada", "United Kingdom", "Germany", "France", "Italy", "Spain", "Netherlands", "Belgium", "Switzerland",
        "Austria", "Sweden", "Norway", "Denmark", "Finland", "Poland", "Czech Republic", "Hungary", "Romania", "Bulgaria",
        "Greece", "Portugal", "Ireland", "Iceland", "Luxembourg", "Malta", "Cyprus", "Estonia", "Latvia", "Lithuania",
        "Slovenia", "Croatia", "Slovakia", "Serbia", "Montenegro", "Bosnia and Herzegovina", "North Macedonia", "Albania",
        "Kosovo", "Moldova", "Ukraine", "Belarus", "Russia", "Georgia", "Armenia", "Azerbaijan", "Kazakhstan", "Uzbekistan",
        "Turkmenistan", "Kyrgyzstan", "Tajikistan", "Mongolia", "China", "Japan", "South Korea", "North Korea", "Taiwan",
        "Hong Kong", "Macau", "Vietnam", "Laos", "Cambodia", "Thailand", "Myanmar", "Malaysia", "Singapore", "Indonesia",
        "Philippines", "Brunei", "East Timor", "Papua New Guinea", "Australia", "New Zealand", "Fiji", "Vanuatu", "Solomon Islands",
        "Kiribati", "Tuvalu", "Nauru", "Palau", "Micronesia", "Marshall Islands", "Samoa", "Tonga", "Cook Islands", "Niue",
        "Tokelau", "American Samoa", "Guam", "Northern Mariana Islands", "Federated States of Micronesia", "Palau",
        "Marshall Islands", "Nauru", "Kiribati", "Tuvalu", "Vanuatu", "Solomon Islands", "Papua New Guinea", "Fiji",
        "New Zealand", "Australia", "India", "Pakistan", "Bangladesh", "Sri Lanka", "Nepal", "Bhutan", "Maldives",
        "Afghanistan", "Iran", "Iraq", "Syria", "Lebanon", "Jordan", "Israel", "Palestine", "Saudi Arabia", "Yemen",
        "Oman", "United Arab Emirates", "Qatar", "Bahrain", "Kuwait", "Turkey", "Cyprus", "Greece", "Bulgaria", "Romania",
        "Hungary", "Slovakia", "Czech Republic", "Poland", "Germany", "Austria", "Switzerland", "Liechtenstein", "Italy",
        "San Marino", "Vatican City", "Malta", "Slovenia", "Croatia", "Bosnia and Herzegovina", "Montenegro", "Serbia",
        "North Macedonia", "Albania", "Kosovo", "Greece", "Bulgaria", "Romania", "Moldova", "Ukraine", "Belarus", "Russia",
        "Estonia", "Latvia", "Lithuania", "Finland", "Sweden", "Norway", "Denmark", "Iceland", "Faroe Islands", "Greenland",
        "Canada", "United States", "Mexico", "Guatemala", "Belize", "El Salvador", "Honduras", "Nicaragua", "Costa Rica",
        "Panama", "Colombia", "Venezuela", "Guyana", "Suriname", "French Guiana", "Brazil", "Ecuador", "Peru", "Bolivia",
        "Paraguay", "Uruguay", "Argentina", "Chile", "Falkland Islands", "South Georgia and the South Sandwich Islands",
        "Antarctica"
    ]
    
    // MARK: - UI Configuration
    static let welcomeScreenDuration: TimeInterval = 3.0
    static let animationDuration: Double = 0.3
    static let loadingTimeout: TimeInterval = 30.0
    
    // MARK: - Validation Rules
    struct Validation {
        static let minPasswordLength = 6
        static let maxPasswordLength = 50
        static let sevisIdPattern = "^N\\d{10}$"
        static let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    }
    
    // MARK: - Error Messages
    struct ErrorMessages {
        static let invalidEmail = "Please enter a valid email address"
        static let invalidPassword = "Password must be at least 6 characters long"
        static let invalidSevisId = "Please enter a valid SEVIS ID (N followed by 10 digits)"
        static let requiredField = "This field is required"
        static let networkError = "Network error. Please try again"
        static let paymentFailed = "Payment failed. Please try again"
        static let invalidCredentials = "Invalid email or password"
    }
    
    // MARK: - Success Messages
    struct SuccessMessages {
        static let paymentSuccessful = "Payment completed successfully!"
        static let accountCreated = "Account created successfully!"
        static let loginSuccessful = "Welcome back!"
    }
} 