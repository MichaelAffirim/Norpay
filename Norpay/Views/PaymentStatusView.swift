import SwiftUI

struct PaymentStatusView: View {
    @ObservedObject var paymentViewModel: PaymentViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var sevisId = ""
    @State private var lastName = ""
    @State private var dateOfBirth = Date()
    @State private var searchResults: [Payment] = []
    @State private var hasSearched = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.9, green: 0.95, blue: 1.0)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Header
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                        }
                        
                        Spacer()
                        
                        Text("Payment Status")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "bell")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                        }
                    }
                    .padding(.horizontal)
                    
                    // Search Section
                    VStack(spacing: 15) {
                        HStack {
                            TextField("SEVIS ID", text: $sevisId)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(maxWidth: .infinity)
                            
                            TextField("Last Name", text: $lastName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(maxWidth: .infinity)
                            
                            DatePicker("", selection: $dateOfBirth, displayedComponents: .date)
                                .datePickerStyle(CompactDatePickerStyle())
                                .labelsHidden()
                                .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            searchResults = paymentViewModel.checkPaymentStatus(
                                sevisId: sevisId,
                                lastName: lastName,
                                dateOfBirth: dateOfBirth
                            )
                            hasSearched = true
                        }) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Text("Search Payment Status")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                            .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Results Section
                    if hasSearched {
                        if searchResults.isEmpty {
                            VStack(spacing: 15) {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 50))
                                    .foregroundColor(.gray)
                                
                                Text("No payments found")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                Text("Try adjusting your search criteria")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.top, 50)
                        } else {
                            VStack(spacing: 10) {
                                Text("Payment History")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                
                                ScrollView {
                                    LazyVStack(spacing: 10) {
                                        ForEach(searchResults) { payment in
                                            PaymentDetailCard(payment: payment)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    } else {
                        // Show all payments initially
                        VStack(spacing: 10) {
                            Text("Recent Payments")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            ScrollView {
                                LazyVStack(spacing: 10) {
                                    ForEach(paymentViewModel.payments) { payment in
                                        PaymentDetailCard(payment: payment)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct PaymentDetailCard: View {
    let payment: Payment
    
    var statusColor: Color {
        switch payment.status {
        case .paid:
            return .green
        case .pending:
            return .orange
        case .failed:
            return .red
        case .processing:
            return .blue
        }
    }
    
    var statusIcon: String {
        switch payment.status {
        case .paid:
            return "checkmark.circle.fill"
        case .pending:
            return "clock.fill"
        case .failed:
            return "xmark.circle.fill"
        case .processing:
            return "arrow.clockwise.circle.fill"
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            // Header
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("SEVIS ID: \(payment.sevisId)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("Form: \(payment.formType.rawValue)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    HStack {
                        Image(systemName: statusIcon)
                            .foregroundColor(statusColor)
                        Text(payment.status.rawValue)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(statusColor)
                    }
                    
                    Text("$\(String(format: "%.2f", payment.totalAmount))")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
            
            Divider()
            
            // Details
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("School Code")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(payment.schoolCode)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Email")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(payment.userEmail)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Date")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(payment.dateCreated, style: .date)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
            }
            
            if let paymentMethod = payment.paymentMethod {
                Divider()
                
                HStack {
                    Text("Payment Method:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(paymentMethod.rawValue)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    if let datePaid = payment.datePaid {
                        Text("Paid: \(datePaid, style: .date)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    PaymentStatusView(paymentViewModel: PaymentViewModel())
} 