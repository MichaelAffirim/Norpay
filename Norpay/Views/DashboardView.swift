import SwiftUI

struct DashboardView: View {
    @StateObject private var paymentViewModel = PaymentViewModel()
    @State private var showingPaymentForm = false
    @State private var showingStatusCheck = false
    @State private var showingCustomerService = false
    @State private var showingShareSheet = false
    @State private var showingNotifications = false
    @State private var notifications: [NotificationItem] = [
        NotificationItem(
            id: UUID(),
            title: "Payment Successful!",
            message: "Your SEVIS fee payment has been processed successfully.",
            type: .success,
            timestamp: Date(),
            isRead: false
        ),
        NotificationItem(
            id: UUID(),
            title: "Payment Reminder",
            message: "Don't forget to pay your SEVIS fee before your deadline.",
            type: .reminder,
            timestamp: Date().addingTimeInterval(-3600),
            isRead: false
        ),
        NotificationItem(
            id: UUID(),
            title: "System Update",
            message: "New features have been added to Norpay. Check them out!",
            type: .info,
            timestamp: Date().addingTimeInterval(-7200),
            isRead: true
        )
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.9, green: 0.95, blue: 1.0)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Header
                    HStack {
                        HStack(spacing: 10) {
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                            
                            Text("Norpay")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Button(action: {
                            showingNotifications = true
                        }) {
                            ZStack {
                                Image(systemName: "bell")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                
                                if notifications.filter({ !$0.isRead }).count > 0 {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 8, height: 8)
                                        .offset(x: 8, y: -8)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color(red: 0.1, green: 0.2, blue: 0.4))
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            // SEVIS Fee Banner
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 60, height: 60)
                                    
                                    Image(systemName: "building.columns.fill")
                                        .font(.title2)
                                        .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.4))
                                }
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("SEVIS FEE | I-901")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.4))
                                    
                                    Text("PAYMENT MADE WITH A SIMPLE 😊")
                                        .font(.subheadline)
                                        .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.4))
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                            .padding(.horizontal)
                            
                            // Form Type Pricing Section
                            VStack(spacing: 15) {
                                Text("Form Types & Pricing")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach(FormType.allCases, id: \.self) { formType in
                                            FormTypeCard(formType: formType)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            
                            // Search Section
                            VStack(spacing: 15) {
                                HStack {
                                    TextField("N000000000", text: .constant(""))
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .frame(maxWidth: .infinity)
                                    
                                    TextField("Last Name", text: .constant(""))
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .frame(maxWidth: .infinity)
                                    
                                    TextField("DOB", text: .constant(""))
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .frame(maxWidth: .infinity)
                                    
                                    Button(action: {
                                        showingStatusCheck = true
                                    }) {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                                            .cornerRadius(8)
                                    }
                                }
                                .padding(.horizontal)
                                
                                Button(action: {
                                    showingStatusCheck = true
                                }) {
                                    HStack {
                                        Text("CHECK SEVIS FEE PAYMENT STATUS")
                                            .fontWeight(.semibold)
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                                                    }
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                                .cornerRadius(10)
                                }
                                .padding(.horizontal)
                            }
                            
                            // Payment Status List
                            VStack(spacing: 10) {
                                ForEach(paymentViewModel.payments.prefix(3)) { payment in
                                    PaymentStatusRow(payment: payment)
                                }
                            }
                            .padding(.horizontal)
                            
                            // Main Action Button
                            Button(action: {
                                showingPaymentForm = true
                            }) {
                                Text("PAY SEVIS FEE | I-901")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                                                .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                                    .cornerRadius(15)
                            }
                            .padding(.horizontal)
                            .padding(.top, 20)
                        }
                    }
                    
                    // Footer
                    HStack {
                        Button(action: {
                            showingShareSheet = true
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                                .cornerRadius(8)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showingCustomerService = true
                        }) {
                            Image(systemName: "message")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color(red: 0.1, green: 0.2, blue: 0.4))
                }
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showingPaymentForm) {
            ApplicantValidationView(paymentViewModel: paymentViewModel)
        }
        .sheet(isPresented: $showingStatusCheck) {
            PaymentStatusView(paymentViewModel: paymentViewModel)
        }
        .sheet(isPresented: $showingCustomerService) {
            CustomerServiceChatView()
        }
        .sheet(isPresented: $showingShareSheet) {
            ShareSheet(activityItems: [
                "Check out Norpay - The easiest way to pay your SEVIS Fee! 📱💳",
                "Download Norpay from the App Store: https://apps.apple.com/app/norpay",
                "Simplify your SEVIS I-901 payment process with Norpay! #SEVIS #StudentVisa #Norpay"
            ])
        }
        .sheet(isPresented: $showingNotifications) {
            NotificationView(notifications: $notifications)
        }
    }
}

struct PaymentStatusRow: View {
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
    
    var body: some View {
        HStack {
            Text(payment.sevisId)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
            
            Text(payment.status.rawValue)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Circle()
                .fill(statusColor)
                .frame(width: 12, height: 12)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: [
                WhatsAppActivity(),
                InstagramActivity(),
                iMessageActivity(),
                TelegramActivity(),
                TwitterActivity(),
                FacebookActivity(),
                LinkedInActivity(),
                SnapchatActivity()
            ]
        )
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// Custom WhatsApp sharing activity
class WhatsAppActivity: UIActivity {
    override var activityTitle: String? {
        return "WhatsApp"
    }
    
    override var activityImage: UIImage? {
        return UIImage(systemName: "message.fill")
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("com.whatsapp.share")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        guard let url = URL(string: "whatsapp://") else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    override func perform() {
        guard let url = URL(string: "whatsapp://send?text=Check out Norpay - The easiest way to pay your SEVIS Fee! 📱💳 Download from App Store: https://apps.apple.com/app/norpay #SEVIS #StudentVisa #Norpay") else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
        activityDidFinish(true)
    }
}

// Custom iMessage sharing activity
class iMessageActivity: UIActivity {
    override var activityTitle: String? {
        return "iMessage"
    }
    
    override var activityImage: UIImage? {
        return UIImage(systemName: "message.fill")
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("com.apple.messages.share")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true // iMessage is always available on iOS
    }
    
    override func perform() {
        let shareText = "Check out Norpay - The easiest way to pay your SEVIS Fee! 📱💳\n\nDownload from App Store: https://apps.apple.com/app/norpay\n\n#SEVIS #StudentVisa #Norpay"
        
        if let url = URL(string: "sms:&body=\(shareText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
            UIApplication.shared.open(url)
        }
        activityDidFinish(true)
    }
}

// Custom Telegram sharing activity
class TelegramActivity: UIActivity {
    override var activityTitle: String? {
        return "Telegram"
    }
    
    override var activityImage: UIImage? {
        return UIImage(systemName: "paperplane.fill")
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("com.telegram.share")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        guard let url = URL(string: "telegram://") else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    override func perform() {
        let shareText = "Check out Norpay - The easiest way to pay your SEVIS Fee! 📱💳\n\nDownload from App Store: https://apps.apple.com/app/norpay\n\n#SEVIS #StudentVisa #Norpay"
        
        if let encodedText = shareText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "telegram://msg?text=\(encodedText)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        activityDidFinish(true)
    }
}

// Custom Twitter/X sharing activity
class TwitterActivity: UIActivity {
    override var activityTitle: String? {
        return "Twitter/X"
    }
    
    override var activityImage: UIImage? {
        return UIImage(systemName: "bird.fill")
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("com.twitter.share")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        guard let url = URL(string: "twitter://") else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    override func perform() {
        let shareText = "Check out Norpay - The easiest way to pay your SEVIS Fee! 📱💳\n\nDownload from App Store: https://apps.apple.com/app/norpay\n\n#SEVIS #StudentVisa #Norpay #StudyAbroad"
        
        if let encodedText = shareText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "twitter://post?message=\(encodedText)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        activityDidFinish(true)
    }
}

// Custom Facebook sharing activity
class FacebookActivity: UIActivity {
    override var activityTitle: String? {
        return "Facebook"
    }
    
    override var activityImage: UIImage? {
        return UIImage(systemName: "f.square.fill")
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("com.facebook.share")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        guard let url = URL(string: "fb://") else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    override func perform() {
        let shareText = "Check out Norpay - The easiest way to pay your SEVIS Fee! 📱💳\n\nDownload from App Store: https://apps.apple.com/app/norpay\n\n#SEVIS #StudentVisa #Norpay #StudyAbroad"
        
        // Copy to clipboard for Facebook sharing
        UIPasteboard.general.string = shareText
        
        if let url = URL(string: "fb://feed") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        activityDidFinish(true)
    }
}

// Custom LinkedIn sharing activity
class LinkedInActivity: UIActivity {
    override var activityTitle: String? {
        return "LinkedIn"
    }
    
    override var activityImage: UIImage? {
        return UIImage(systemName: "l.square.fill")
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("com.linkedin.share")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        guard let url = URL(string: "linkedin://") else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    override func perform() {
        let shareText = "Check out Norpay - The easiest way to pay your SEVIS Fee! 📱💳\n\nDownload from App Store: https://apps.apple.com/app/norpay\n\n#SEVIS #StudentVisa #Norpay #StudyAbroad"
        
        // Copy to clipboard for LinkedIn sharing
        UIPasteboard.general.string = shareText
        
        if let url = URL(string: "linkedin://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        activityDidFinish(true)
    }
}

// Custom Snapchat sharing activity
class SnapchatActivity: UIActivity {
    override var activityTitle: String? {
        return "Snapchat"
    }
    
    override var activityImage: UIImage? {
        return UIImage(systemName: "camera.viewfinder")
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("com.snapchat.share")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        guard let url = URL(string: "snapchat://") else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    override func perform() {
        let shareText = "Check out Norpay - The easiest way to pay your SEVIS Fee! 📱💳\n\nDownload from App Store: https://apps.apple.com/app/norpay\n\n#SEVIS #StudentVisa #Norpay #StudyAbroad"
        
        // Copy to clipboard for Snapchat sharing
        UIPasteboard.general.string = shareText
        
        if let url = URL(string: "snapchat://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        activityDidFinish(true)
    }
}

// Custom Instagram sharing activity
class InstagramActivity: UIActivity {
    override var activityTitle: String? {
        return "Instagram"
    }
    
    override var activityImage: UIImage? {
        return UIImage(systemName: "camera.fill")
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("com.instagram.share")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        guard let url = URL(string: "instagram://") else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    override func perform() {
        let shareText = "Check out Norpay - The easiest way to pay your SEVIS Fee! 📱💳\n\nDownload from App Store: https://apps.apple.com/app/norpay\n\n#SEVIS #StudentVisa #Norpay #StudyAbroad"
        
        // Copy text to clipboard for Instagram Stories/Feed
        UIPasteboard.general.string = shareText
        
        // Try to open Instagram Stories
        if let url = URL(string: "instagram-stories://share") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                // Fallback to regular Instagram
                if let instagramUrl = URL(string: "instagram://") {
                    UIApplication.shared.open(instagramUrl)
                }
            }
        }
        activityDidFinish(true)
    }
}

// MARK: - Notification Models and Views

struct NotificationItem: Identifiable {
    let id: UUID
    let title: String
    let message: String
    let type: NotificationType
    let timestamp: Date
    var isRead: Bool
    
    enum NotificationType {
        case success, warning, error, info, reminder
        
        var icon: String {
            switch self {
            case .success:
                return "checkmark.circle.fill"
            case .warning:
                return "exclamationmark.triangle.fill"
            case .error:
                return "xmark.circle.fill"
            case .info:
                return "info.circle.fill"
            case .reminder:
                return "bell.fill"
            }
        }
        
        var color: Color {
            switch self {
            case .success:
                return .green
            case .warning:
                return .orange
            case .error:
                return .red
            case .info:
                return .blue
            case .reminder:
                return .purple
            }
        }
    }
}

struct NotificationView: View {
    @Binding var notifications: [NotificationItem]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.9, green: 0.95, blue: 1.0)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                        }
                        
                        Spacer()
                        
                        Text("Notifications")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action: {
                            markAllAsRead()
                        }) {
                            Text("Mark All Read")
                                .font(.caption)
                                .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                    
                    if notifications.isEmpty {
                        VStack(spacing: 20) {
                            Spacer()
                            
                            Image(systemName: "bell.slash")
                                .font(.system(size: 60))
                                .foregroundColor(.gray)
                            
                            Text("No Notifications")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            
                            Text("You're all caught up!")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(notifications) { notification in
                                    NotificationCard(
                                        notification: notification,
                                        onTap: {
                                            markAsRead(notification)
                                        }
                                    )
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func markAsRead(_ notification: NotificationItem) {
        if let index = notifications.firstIndex(where: { $0.id == notification.id }) {
            notifications[index].isRead = true
        }
    }
    
    private func markAllAsRead() {
        for index in notifications.indices {
            notifications[index].isRead = true
        }
    }
}

struct NotificationCard: View {
    let notification: NotificationItem
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                // Icon
                Image(systemName: notification.type.icon)
                    .font(.title2)
                    .foregroundColor(notification.type.color)
                    .frame(width: 30, height: 30)
                
                // Content
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(notification.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text(notification.timestamp, style: .relative)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Text(notification.message)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                
                // Read indicator
                if !notification.isRead {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 8, height: 8)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct FormTypeCard: View {
    let formType: FormType
    
    var body: some View {
        VStack(spacing: 12) {
            // Form Type Header
            HStack {
                Text(formType.rawValue)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "doc.text.fill")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            // Description
            Text(formType.description)
                .font(.caption)
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            // Pricing
            VStack(spacing: 4) {
                HStack {
                    Text("Base Fee:")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Spacer()
                    
                    Text("$\(String(format: "%.0f", formType.baseAmount))")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                
                HStack {
                    Text("Processing:")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Spacer()
                    
                    Text("$\(String(format: "%.0f", formType.processingFee))")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text("Total:")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("$\(String(format: "%.0f", formType.totalAmount))")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .frame(width: 160, height: 180)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.2, green: 0.4, blue: 0.8),
                    Color(red: 0.1, green: 0.2, blue: 0.4)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    DashboardView()
} 