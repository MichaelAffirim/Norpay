import Foundation

enum PaymentStatus: String, CaseIterable, Codable {
    case pending = "PENDING"
    case paid = "PAID"
    case failed = "FAILED"
    case processing = "PROCESSING"
}

enum PaymentMethod: String, CaseIterable, Codable {
    case creditCard = "Credit Card"
    case mobileMoney = "Mobile Money"
}

enum FormType: String, CaseIterable, Codable {
    case f1 = "F-1"
    case j1 = "J-1"
    case m1 = "M-1"
    case f2 = "F-2"
    case j2 = "J-2"
    case m2 = "M-2"
    
    var baseAmount: Double {
        switch self {
        case .f1, .j1, .m1:
            return 350.0
        case .f2, .j2, .m2:
            return 220.0
        }
    }
    
    var processingFee: Double {
        switch self {
        case .f1, .j1, .m1:
            return 35.0
        case .f2, .j2, .m2:
            return 22.0
        }
    }
    
    var totalAmount: Double {
        return baseAmount + processingFee
    }
    
    var description: String {
        switch self {
        case .f1:
            return "Academic Student"
        case .j1:
            return "Exchange Visitor"
        case .m1:
            return "Vocational Student"
        case .f2:
            return "F-1 Dependent"
        case .j2:
            return "J-1 Dependent"
        case .m2:
            return "M-1 Dependent"
        }
    }
}

struct Payment: Codable, Identifiable {
    let id = UUID()
    var sevisId: String
    var amount: Double
    var fee: Double
    var totalAmount: Double
    var status: PaymentStatus
    var paymentMethod: PaymentMethod?
    var dateCreated: Date
    var datePaid: Date?
    var userEmail: String
    var schoolCode: String
    var formType: FormType
    var countryOfCitizenship: String
    var countryOfBirth: String
    
    init(sevisId: String, formType: FormType, userEmail: String, schoolCode: String, countryOfCitizenship: String, countryOfBirth: String) {
        self.sevisId = sevisId
        self.formType = formType
        self.amount = formType.baseAmount
        self.fee = formType.processingFee
        self.totalAmount = formType.totalAmount
        self.status = .pending
        self.dateCreated = Date()
        self.userEmail = userEmail
        self.schoolCode = schoolCode
        self.countryOfCitizenship = countryOfCitizenship
        self.countryOfBirth = countryOfBirth
    }
} 