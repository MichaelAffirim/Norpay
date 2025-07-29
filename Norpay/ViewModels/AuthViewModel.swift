import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var isLoading = false
    @Published var errorMessage = ""
    
    func login(email: String, password: String) {
        isLoading = true
        errorMessage = ""
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isLoading = false
            
            // Simple validation for demo
            if email.contains("@") && password.count >= 6 {
                self.isAuthenticated = true
                self.currentUser = User(
                    email: email,
                    firstName: "John",
                    lastName: "Doe",
                    country: "Ghana",
                    dateOfBirth: Date()
                )
            } else {
                self.errorMessage = "Invalid email or password"
            }
        }
    }
    
    func logout() {
        isAuthenticated = false
        currentUser = nil
    }
    
    func register(email: String, password: String, firstName: String, lastName: String) {
        isLoading = true
        errorMessage = ""
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isLoading = false
            
            if email.contains("@") && password.count >= 6 && !firstName.isEmpty && !lastName.isEmpty {
                self.isAuthenticated = true
                self.currentUser = User(
                    email: email,
                    firstName: firstName,
                    lastName: lastName,
                    country: "Ghana",
                    dateOfBirth: Date()
                )
            } else {
                self.errorMessage = "Please fill all fields correctly"
            }
        }
    }
} 