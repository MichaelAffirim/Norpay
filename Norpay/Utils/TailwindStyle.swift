import SwiftUI

// MARK: - Tailwind-like Color System
struct TailwindColors {
    static let blue50 = Color(red: 0.9, green: 0.95, blue: 1.0)
    static let blue100 = Color(red: 0.8, green: 0.9, blue: 1.0)
    static let blue200 = Color(red: 0.7, green: 0.85, blue: 1.0)
    static let blue300 = Color(red: 0.6, green: 0.8, blue: 1.0)
    static let blue400 = Color(red: 0.4, green: 0.7, blue: 1.0)
    static let blue500 = Color(red: 0.2, green: 0.4, blue: 0.8)
    static let blue600 = Color(red: 0.1, green: 0.3, blue: 0.7)
    static let blue700 = Color(red: 0.1, green: 0.2, blue: 0.6)
    static let blue800 = Color(red: 0.1, green: 0.2, blue: 0.4)
    static let blue900 = Color(red: 0.05, green: 0.1, blue: 0.3)
    
    static let gray50 = Color(red: 0.98, green: 0.98, blue: 0.98)
    static let gray100 = Color(red: 0.95, green: 0.95, blue: 0.95)
    static let gray200 = Color(red: 0.9, green: 0.9, blue: 0.9)
    static let gray300 = Color(red: 0.8, green: 0.8, blue: 0.8)
    static let gray400 = Color(red: 0.7, green: 0.7, blue: 0.7)
    static let gray500 = Color(red: 0.6, green: 0.6, blue: 0.6)
    static let gray600 = Color(red: 0.5, green: 0.5, blue: 0.5)
    static let gray700 = Color(red: 0.4, green: 0.4, blue: 0.4)
    static let gray800 = Color(red: 0.3, green: 0.3, blue: 0.3)
    static let gray900 = Color(red: 0.2, green: 0.2, blue: 0.2)
    
    static let white = Color.white
    static let black = Color.black
    static let red = Color.red
    static let green = Color.green
    static let yellow = Color.yellow
    static let orange = Color.orange
}

// MARK: - Tailwind-like Spacing System
struct TailwindSpacing {
    static let px1: CGFloat = 1
    static let px2: CGFloat = 2
    static let px3: CGFloat = 3
    static let px4: CGFloat = 4
    static let px5: CGFloat = 5
    static let px6: CGFloat = 6
    static let px8: CGFloat = 8
    static let px10: CGFloat = 10
    static let px12: CGFloat = 12
    static let px16: CGFloat = 16
    static let px20: CGFloat = 20
    static let px24: CGFloat = 24
    static let px32: CGFloat = 32
    static let px40: CGFloat = 40
    static let px48: CGFloat = 48
    static let px56: CGFloat = 56
    static let px64: CGFloat = 64
}

// MARK: - Tailwind-like Border Radius System
struct TailwindRadius {
    static let none: CGFloat = 0
    static let sm: CGFloat = 2
    static let base: CGFloat = 4
    static let md: CGFloat = 6
    static let lg: CGFloat = 8
    static let xl: CGFloat = 12
    static let xl2: CGFloat = 16
    static let xl3: CGFloat = 24
    static let full: CGFloat = 9999
}

// MARK: - Tailwind-like Shadow System
struct TailwindShadow {
    static let none = Color.clear
    static let sm = Color.black.opacity(0.05)
    static let base = Color.black.opacity(0.1)
    static let md = Color.black.opacity(0.15)
    static let lg = Color.black.opacity(0.2)
    static let xl = Color.black.opacity(0.25)
    static let xl2 = Color.black.opacity(0.3)
}

// MARK: - Tailwind-like View Modifiers
struct BackgroundColorModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content.background(color)
    }
}

struct TextColorModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content.foregroundColor(color)
    }
}

struct PaddingModifier: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content.padding(size)
    }
}

struct HorizontalPaddingModifier: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content.padding(.horizontal, size)
    }
}

struct VerticalPaddingModifier: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content.padding(.vertical, size)
    }
}

struct CornerRadiusModifier: ViewModifier {
    let radius: CGFloat
    
    func body(content: Content) -> some View {
        content.cornerRadius(radius)
    }
}

struct ShadowModifier: ViewModifier {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    
    func body(content: Content) -> some View {
        content.shadow(color: color, radius: radius, x: x, y: y)
    }
}

struct BorderModifier: ViewModifier {
    let color: Color
    let width: CGFloat
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(color, lineWidth: width)
        )
    }
}

// MARK: - Tailwind-like Button Styles
struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(TailwindColors.white)
            .padding(.horizontal, TailwindSpacing.px6)
            .padding(.vertical, TailwindSpacing.px4)
            .background(TailwindColors.blue500)
            .cornerRadius(TailwindRadius.lg)
            .shadow(color: TailwindShadow.base, radius: 4, x: 0, y: 2)
    }
}

struct SecondaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(TailwindColors.blue500)
            .padding(.horizontal, TailwindSpacing.px6)
            .padding(.vertical, TailwindSpacing.px4)
            .background(TailwindColors.white)
            .cornerRadius(TailwindRadius.lg)
            .overlay(
                RoundedRectangle(cornerRadius: TailwindRadius.lg)
                    .stroke(TailwindColors.blue500, lineWidth: 2)
            )
            .shadow(color: TailwindShadow.sm, radius: 2, x: 0, y: 1)
    }
}

struct OutlineButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(TailwindColors.gray700)
            .padding(.horizontal, TailwindSpacing.px6)
            .padding(.vertical, TailwindSpacing.px4)
            .background(TailwindColors.white)
            .cornerRadius(TailwindRadius.lg)
            .overlay(
                RoundedRectangle(cornerRadius: TailwindRadius.lg)
                    .stroke(TailwindColors.gray300, lineWidth: 1)
            )
    }
}

// MARK: - Tailwind-like Text Styles
struct H1TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(TailwindColors.black)
    }
}

struct H2TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(TailwindColors.black)
    }
}

struct H3TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(TailwindColors.black)
    }
}

struct BodyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(TailwindColors.gray700)
    }
}

struct CaptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(TailwindColors.gray500)
    }
}

// MARK: - Tailwind-like Card Style
struct BaseCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(TailwindColors.white)
            .cornerRadius(TailwindRadius.xl)
            .shadow(color: TailwindShadow.base, radius: 8, x: 0, y: 4)
    }
}

struct ElevatedCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(TailwindColors.white)
            .cornerRadius(TailwindRadius.xl)
            .shadow(color: TailwindShadow.lg, radius: 12, x: 0, y: 6)
    }
}

// MARK: - Extension for easier usage
extension View {
    func bg(_ color: Color) -> some View {
        self.modifier(BackgroundColorModifier(color: color))
    }
    
    func text(_ color: Color) -> some View {
        self.modifier(TextColorModifier(color: color))
    }
    
    func p(_ size: CGFloat) -> some View {
        self.modifier(PaddingModifier(size: size))
    }
    
    func px(_ size: CGFloat) -> some View {
        self.modifier(HorizontalPaddingModifier(size: size))
    }
    
    func py(_ size: CGFloat) -> some View {
        self.modifier(VerticalPaddingModifier(size: size))
    }
    
    func rounded(_ radius: CGFloat) -> some View {
        self.modifier(CornerRadiusModifier(radius: radius))
    }
    
    func shadow(_ color: Color, radius: CGFloat = 4, x: CGFloat = 0, y: CGFloat = 2) -> some View {
        self.modifier(ShadowModifier(color: color, radius: radius, x: x, y: y))
    }
    
    func border(_ color: Color, width: CGFloat = 1) -> some View {
        self.modifier(BorderModifier(color: color, width: width))
    }
    
    func buttonPrimary() -> some View {
        self.modifier(PrimaryButtonModifier())
    }
    
    func buttonSecondary() -> some View {
        self.modifier(SecondaryButtonModifier())
    }
    
    func buttonOutline() -> some View {
        self.modifier(OutlineButtonModifier())
    }
    
    func textH1() -> some View {
        self.modifier(H1TextModifier())
    }
    
    func textH2() -> some View {
        self.modifier(H2TextModifier())
    }
    
    func textH3() -> some View {
        self.modifier(H3TextModifier())
    }
    
    func textBody() -> some View {
        self.modifier(BodyTextModifier())
    }
    
    func textCaption() -> some View {
        self.modifier(CaptionTextModifier())
    }
    
    func cardBase() -> some View {
        self.modifier(BaseCardModifier())
    }
    
    func cardElevated() -> some View {
        self.modifier(ElevatedCardModifier())
    }
} 