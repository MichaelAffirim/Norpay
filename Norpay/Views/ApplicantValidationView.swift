import SwiftUI

struct ApplicantValidationView: View {
    @ObservedObject var paymentViewModel: PaymentViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var sevisId = ""
    @State private var lastName = ""
    @State private var givenName = ""
    @State private var dateOfBirth = Date()
    @State private var formType: FormType = .f1
    @State private var schoolCode = ""
    @State private var email = ""
    @State private var countryOfCitizenship = ""
    @State private var countryOfBirth = ""
    @State private var currentStep = 1
    let countries = ["Ghana", "Nigeria", "Kenya", "South Africa", "Uganda", "Tanzania", "Ethiopia", "Rwanda", "Senegal", "Morocco", "Egypt", "Tunisia", "Algeria", "Libya", "Sudan", "Chad", "Niger", "Mali", "Burkina Faso", "Côte d'Ivoire", "Benin", "Togo", "Sierra Leone", "Liberia", "Guinea", "Guinea-Bissau", "The Gambia", "Cape Verde", "Mauritania", "Mauritius", "Seychelles", "Comoros", "Madagascar", "Malawi", "Zambia", "Zimbabwe", "Botswana", "Namibia", "Lesotho", "Eswatini", "Mozambique", "Angola", "Democratic Republic of the Congo", "Republic of the Congo", "Gabon", "Equatorial Guinea", "São Tomé and Príncipe", "Central African Republic", "Cameroon", "Chad", "Niger", "Mali", "Burkina Faso", "Côte d'Ivoire", "Benin", "Togo", "Sierra Leone", "Liberia", "Guinea", "Guinea-Bissau", "The Gambia", "Cape Verde", "Mauritania", "Mauritius", "Seychelles", "Comoros", "Madagascar", "Malawi", "Zambia", "Zimbabwe", "Botswana", "Namibia", "Lesotho", "Eswatini", "Mozambique", "Angola", "Democratic Republic of the Congo", "Republic of the Congo", "Gabon", "Equatorial Guinea", "São Tomé and Príncipe", "Central African Republic", "Cameroon"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.9, green: 0.95, blue: 1.0)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Header with SEVIS Banner
                    HStack {
                        Button(action: {
                            if currentStep > 1 {
                                currentStep -= 1
                            } else {
                                dismiss()
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                        }
                        
                        Spacer()
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "building.columns.fill")
                                    .font(.caption)
                                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                            }
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("SEVIS FEE | I-901")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                                
                                Text("PAYMENT MADE WITH A SIMPLE 😊")
                                    .font(.caption2)
                                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // Progress Indicator
                    HStack(spacing: 20) {
                        ForEach(1...4, id: \.self) { step in
                            VStack {
                                Circle()
                                    .fill(step <= currentStep ? Color(red: 0.2, green: 0.4, blue: 0.8) : Color.gray.opacity(0.3))
                                    .frame(width: 20, height: 20)
                                
                                if step < 4 {
                                    Rectangle()
                                        .fill(step < currentStep ? Color(red: 0.2, green: 0.4, blue: 0.8) : Color.gray.opacity(0.3))
                                        .frame(width: 30, height: 2)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Title
                    Text("Applicant Validation")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("Enter the following information exactly as it appears on your Form I-20 or DS-2019.")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text("\"*\" Indicates that the information is required.")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    
                    // Form Content
                    ScrollView {
                        VStack(spacing: 20) {
                            if currentStep == 1 {
                                Step1View(
                                    sevisId: $sevisId,
                                    lastName: $lastName,
                                    givenName: $givenName,
                                    dateOfBirth: $dateOfBirth
                                )
                            } else if currentStep == 2 {
                                Step2View(
                                    formType: $formType,
                                    schoolCode: $schoolCode
                                )
                            } else if currentStep == 3 {
                                Step3View(
                                    email: $email,
                                    countryOfCitizenship: $countryOfCitizenship,
                                    countryOfBirth: $countryOfBirth,
                                    countries: countries
                                )
                            } else if currentStep == 4 {
                                Step4View(
                                    paymentViewModel: paymentViewModel,
                                    sevisId: sevisId,
                                    lastName: lastName,
                                    givenName: givenName,
                                    dateOfBirth: dateOfBirth,
                                    formType: formType,
                                    schoolCode: schoolCode,
                                    email: email,
                                    countryOfCitizenship: countryOfCitizenship,
                                    countryOfBirth: countryOfBirth
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Navigation Buttons
                    HStack {
                        if currentStep > 1 {
                            Button("Back") {
                                currentStep -= 1
                            }
                            .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                        }
                        
                        Spacer()
                        
                        if currentStep < 4 {
                            Button("Continue") {
                                currentStep += 1
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 10)
                            .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct Step1View: View {
    @Binding var sevisId: String
    @Binding var lastName: String
    @Binding var givenName: String
    @Binding var dateOfBirth: Date
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Text("SEVIS ID *")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                TextField("N0000000000", text: $sevisId)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Last Name *")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Given Name")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                TextField("First Name and Middle Name", text: $givenName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Date Of Birth *")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                DatePicker("", selection: $dateOfBirth, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .labelsHidden()
            }
        }
    }
}

struct Step2View: View {
    @Binding var formType: FormType
    @Binding var schoolCode: String
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Form Type *")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Picker("Select a Form type", selection: $formType) {
                    ForEach(FormType.allCases, id: \.self) { type in
                        Text("\(type.rawValue) - \(type.description)").tag(type)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("School Code *")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                HStack {
                    TextField("ABC", text: .constant("ABC"))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("214F", text: .constant("214F"))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("#####", text: .constant("#####"))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("###", text: .constant("###"))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            
            HStack {
                Text("Amount $\(String(format: "%.0f", formType.baseAmount))")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text("Pay Charge $\(String(format: "%.0f", formType.processingFee))")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
            
            HStack {
                Text("Total: $\(String(format: "%.0f", formType.totalAmount))")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
            }
        }
    }
}

struct Step3View: View {
    @Binding var email: String
    @Binding var countryOfCitizenship: String
    @Binding var countryOfBirth: String
    let countries: [String]
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Email Address *")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Country of Citizenship *")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Picker("Please Select Country", selection: $countryOfCitizenship) {
                    Text("Please Select Country").tag("")
                    ForEach(countries, id: \.self) { country in
                        Text(country).tag(country)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Country of Birth *")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Picker("Please Select Country", selection: $countryOfBirth) {
                    Text("Please Select Country").tag("")
                    ForEach(countries, id: \.self) { country in
                        Text(country).tag(country)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
        }
    }
}

struct Step4View: View {
    @ObservedObject var paymentViewModel: PaymentViewModel
    @Environment(\.dismiss) private var dismiss
    
    let sevisId: String
    let lastName: String
    let givenName: String
    let dateOfBirth: Date
    let formType: FormType
    let schoolCode: String
    let email: String
    let countryOfCitizenship: String
    let countryOfBirth: String
    
    @State private var selectedPaymentMethod: PaymentMethod = .creditCard
    @State private var agreedToTerms = false
    @State private var showingPaymentConfirmation = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Payment")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            VStack(spacing: 15) {
                // Payment Method Selection
                VStack(spacing: 10) {
                    PaymentMethodButton(
                        title: "Credit Card",
                        icon: "creditcard.fill",
                        isSelected: selectedPaymentMethod == .creditCard
                    ) {
                        selectedPaymentMethod = .creditCard
                    }
                    
                    PaymentMethodButton(
                        title: "Mobile Money",
                        icon: "iphone",
                        isSelected: selectedPaymentMethod == .mobileMoney
                    ) {
                        selectedPaymentMethod = .mobileMoney
                    }
                }
                
                // Payment Summary
                VStack(spacing: 8) {
                    HStack {
                        Text("Base Fee:")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Spacer()
                        Text("$\(String(format: "%.0f", formType.baseAmount))")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    
                    HStack {
                        Text("Processing Fee:")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Spacer()
                        Text("$\(String(format: "%.0f", formType.processingFee))")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Total Amount:")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                        Text("$\(String(format: "%.0f", formType.totalAmount))")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 10)
                
                // Terms and Conditions
                HStack {
                    Button(action: {
                        agreedToTerms.toggle()
                    }) {
                        Image(systemName: agreedToTerms ? "checkmark.square.fill" : "square")
                            .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                    }
                    
                    Text("I agree to Terms and Conditions applied")
                        .font(.caption)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                
                // Confirm Payment Button
                Button(action: {
                    showingPaymentConfirmation = true
                    paymentViewModel.createPayment(
                        sevisId: sevisId,
                        userEmail: email,
                        schoolCode: schoolCode,
                        formType: formType,
                        countryOfCitizenship: countryOfCitizenship,
                        countryOfBirth: countryOfBirth
                    )
                    paymentViewModel.processPayment(paymentMethod: selectedPaymentMethod)
                }) {
                    Text("CONFIRM PAYMENT")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                        .cornerRadius(10)
                }
                .disabled(!agreedToTerms)
                .opacity(agreedToTerms ? 1.0 : 0.6)
            }
        }
        .alert("Payment Processing", isPresented: $showingPaymentConfirmation) {
            Button("OK") {
                dismiss()
            }
        } message: {
            Text("Your payment is being processed. You will receive a confirmation email shortly.")
        }
    }
}

struct PaymentMethodButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(isSelected ? Color(red: 0.2, green: 0.4, blue: 0.8) : .gray)
                
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Circle()
                    .fill(isSelected ? Color(red: 0.2, green: 0.4, blue: 0.8) : Color.gray.opacity(0.3))
                    .frame(width: 20, height: 20)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color(red: 0.2, green: 0.4, blue: 0.8) : Color.gray.opacity(0.3), lineWidth: 2)
            )
        }
    }
}

#Preview {
    ApplicantValidationView(paymentViewModel: PaymentViewModel())
} 