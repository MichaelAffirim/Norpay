import SwiftUI

struct WelcomeView: View {
    @State private var showingLogin = false
    @State private var showingSignUp = false
    
    var body: some View {
        ZStack {
            // Background
                                Color(red: 0.9, green: 0.95, blue: 1.0)
                        .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Logo and App Name
                VStack(spacing: 15) {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 8)
                    
                    Text("Norpay")
                                                .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                }
                .padding(.top, 80)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 50)
                
                // Action Buttons
                VStack(spacing: 15) {
                    Button(action: {
                        showingLogin = true
                    }) {
                        Text("Get Started")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                            .cornerRadius(15)
                    }
                    
                    Button(action: {
                        showingSignUp = true
                    }) {
                        Text("Create Account")
                            .font(.headline)
                            .fontWeight(.semibold)
                                                            .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(red: 0.2, green: 0.4, blue: 0.8), lineWidth: 2)
                            )
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
        .sheet(isPresented: $showingLogin) {
            LoginView()
        }
        .sheet(isPresented: $showingSignUp) {
            SignUpView()
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(AuthViewModel())
} 