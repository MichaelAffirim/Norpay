import Foundation
import SwiftUI

class PaymentViewModel: ObservableObject {
    @Published var payments: [Payment] = []
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var currentPayment: Payment?
    
    init() {
        loadSamplePayments()
    }
    
    func createPayment(sevisId: String, userEmail: String, schoolCode: String, formType: FormType, countryOfCitizenship: String, countryOfBirth: String) {
        let payment = Payment(
            sevisId: sevisId,
            formType: formType,
            userEmail: userEmail,
            schoolCode: schoolCode,
            countryOfCitizenship: countryOfCitizenship,
            countryOfBirth: countryOfBirth
        )
        
        currentPayment = payment
        payments.append(payment)
    }
    
    func processPayment(paymentMethod: PaymentMethod) {
        guard var payment = currentPayment else { return }
        
        isLoading = true
        errorMessage = ""
        
        // Simulate payment processing
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isLoading = false
            
            // Simulate success
            payment.paymentMethod = paymentMethod
            payment.status = .paid
            payment.datePaid = Date()
            
            if let index = self.payments.firstIndex(where: { $0.id == payment.id }) {
                self.payments[index] = payment
            }
            
            self.currentPayment = payment
        }
    }
    
    func checkPaymentStatus(sevisId: String, lastName: String, dateOfBirth: Date) -> [Payment] {
        return payments.filter { payment in
            payment.sevisId.contains(sevisId) || 
            payment.sevisId.contains(lastName) ||
            Calendar.current.isDate(payment.dateCreated, inSameDayAs: dateOfBirth)
        }
    }
    
    private func loadSamplePayments() {
        let samplePayments = [
            Payment(sevisId: "N0001234567", formType: .f1, userEmail: "student1@example.com", schoolCode: "ABC214F0001", countryOfCitizenship: "Ghana", countryOfBirth: "Ghana"),
            Payment(sevisId: "N0007654321", formType: .j1, userEmail: "student2@example.com", schoolCode: "XYZ987G0002", countryOfCitizenship: "Nigeria", countryOfBirth: "Nigeria"),
            Payment(sevisId: "N0001111111", formType: .f1, userEmail: "student3@example.com", schoolCode: "DEF456H0003", countryOfCitizenship: "Kenya", countryOfBirth: "Kenya")
        ]
        
        // Set different statuses for sample data
        payments = samplePayments.enumerated().map { index, payment in
            var modifiedPayment = payment
            if index == 0 {
                modifiedPayment.status = .pending
            } else {
                modifiedPayment.status = .paid
                modifiedPayment.datePaid = Date().addingTimeInterval(-86400 * Double(index))
            }
            return modifiedPayment
        }
    }
} 