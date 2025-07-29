//
//  ContentView.swift
//  Norpay
//
//  Created by Michael Affirim on 7/26/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @State private var showingWelcome = true
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                DashboardView()
            } else if showingWelcome {
                WelcomeView()
                    .onAppear {
                        // Auto-hide welcome screen after 3 seconds
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                showingWelcome = false
                            }
                        }
                    }
            } else {
                LoginView()
            }
        }
        .environmentObject(authViewModel)
    }
}

#Preview {
    ContentView()
}
