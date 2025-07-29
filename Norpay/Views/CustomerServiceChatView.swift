import SwiftUI

struct CustomerServiceChatView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var messageText = ""
    @State private var scrollToBottom = false
    @State private var messages: [ChatMessage] = [
        ChatMessage(id: UUID(), text: "Hello! Welcome to Norpay Customer Service. How can I help you today?", isFromUser: false, timestamp: Date().addingTimeInterval(-300)),
        ChatMessage(id: UUID(), text: "I need help with my SEVIS fee payment", isFromUser: true, timestamp: Date().addingTimeInterval(-240)),
        ChatMessage(id: UUID(), text: "I'd be happy to help you with your SEVIS fee payment. What specific issue are you experiencing?", isFromUser: false, timestamp: Date().addingTimeInterval(-180)),
        ChatMessage(id: UUID(), text: "The payment is showing as pending for 2 days", isFromUser: true, timestamp: Date().addingTimeInterval(-120)),
        ChatMessage(id: UUID(), text: "I understand your concern. SEVIS fee payments typically take 24-48 hours to process. Let me check your payment status for you.", isFromUser: false, timestamp: Date().addingTimeInterval(-60))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.9, green: 0.95, blue: 1.0)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    VStack(spacing: 0) {
                        // Main header with gradient
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 2) {
                                Text("Customer Service")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                                Text("Online")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Image(systemName: "ellipsis")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .background(
                            Color(red: 0.1, green: 0.2, blue: 0.4)
                        )
                        
                        // Customer service agent info card
                        HStack(spacing: 15) {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Norpay Support Team")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("Available 24/7")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Image(systemName: "ellipsis")
                                    .font(.title3)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .background(Color.white)
                        .cornerRadius(0, corners: [.bottomLeft, .bottomRight])
                        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                    }
                    
                    // Messages
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(messages) { message in
                                MessageBubble(message: message)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                    }
                    
                    // Input area
                    VStack(spacing: 0) {
                        Divider()
                        
                        HStack(spacing: 15) {
                            Button(action: {}) {
                                Image(systemName: "paperclip")
                                    .font(.title3)
                                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                            }
                            
                            HStack {
                                TextField("Type a Message", text: $messageText)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    .onSubmit {
                                        sendMessage()
                                    }
                                
                                Button(action: {
                                    sendMessage()
                                }) {
                                    Image(systemName: "paperplane.fill")
                                        .font(.title3)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.gray : Color(red: 0.2, green: 0.4, blue: 0.8))
                                        .cornerRadius(20)
                                }
                                .disabled(messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                            }
                            .background(Color.white)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .background(Color.white)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func sendMessage() {
        let trimmedText = messageText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return }
        
        let newMessage = ChatMessage(
            id: UUID(),
            text: trimmedText,
            isFromUser: true,
            timestamp: Date()
        )
        
        withAnimation(.easeInOut(duration: 0.3)) {
            messages.append(newMessage)
        }
        messageText = ""
        scrollToBottom = true
        
        // Simulate customer service response
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let responses = [
                "Thank you for your message. I'm looking into this for you.",
                "I understand your concern. Let me help you resolve this issue.",
                "I can see your payment in our system. Let me provide you with an update.",
                "Is there anything else I can help you with regarding your SEVIS fee payment?",
                "Your payment should be processed within the next few hours. I'll monitor it for you."
            ]
            
            let randomResponse = responses.randomElement() ?? "Thank you for contacting us."
            
            let responseMessage = ChatMessage(
                id: UUID(),
                text: randomResponse,
                isFromUser: false,
                timestamp: Date()
            )
            
            withAnimation(.easeInOut(duration: 0.3)) {
                messages.append(responseMessage)
            }
            scrollToBottom = true
        }
    }
}

struct MessageBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isFromUser {
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text(message.text)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                        .foregroundColor(.white)
                        .cornerRadius(18, corners: [.topLeft, .topRight, .bottomLeft])
                    
                    Text(formatTimestamp(message.timestamp))
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(.trailing, 5)
                }
                
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
            } else {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(message.text)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(18, corners: [.topLeft, .topRight, .bottomRight])
                        .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 1)
                    
                    Text(formatTimestamp(message.timestamp))
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(.leading, 5)
                }
                
                Spacer()
            }
        }
    }
    
    private func formatTimestamp(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct ChatMessage: Identifiable {
    let id: UUID
    let text: String
    let isFromUser: Bool
    let timestamp: Date
}

// Extension for custom corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    CustomerServiceChatView()
} 