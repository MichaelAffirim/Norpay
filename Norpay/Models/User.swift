import Foundation

struct User: Codable, Identifiable {
    let id = UUID()
    var email: String
    var firstName: String
    var lastName: String
    var country: String
    var dateOfBirth: Date
    var sevisId: String?
    
    init(email: String, firstName: String, lastName: String, country: String, dateOfBirth: Date) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.country = country
        self.dateOfBirth = dateOfBirth
    }
} 