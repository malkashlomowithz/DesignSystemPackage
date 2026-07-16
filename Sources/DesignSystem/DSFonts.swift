//
//  DSFonts.swift
//  DesignSystem
//
//  Created by Malky Shlomowitz on 15/07/2026.
//

import SwiftUI
import UIKit

/// A text style from the design spec, defined as font size, weight, and line height.
public struct DSTextStyle: Sendable {
    
    public let size: CGFloat
    public let weight: Font.Weight
    public let lineHeight: CGFloat

    public var font: Font {
        .system(size: size, weight: weight)
    }

    /// Extra spacing needed to reach the spec's line height. SwiftUI can only
    /// add spacing, so specs tighter than the font's natural line height clamp to 0.
    var extraLineSpacing: CGFloat {
        max(0, lineHeight - UIFont.systemFont(ofSize: size, weight: uiFontWeight).lineHeight)
    }

    private var uiFontWeight: UIFont.Weight {
        switch weight {
        case .bold: .bold
        case .semibold: .semibold
        case .medium: .medium
        default: .regular
        }
    }
}

public struct DSFonts {
    public static let heading1 = DSTextStyle(size: 30, weight: .bold, lineHeight: 30) // Title 1, 30-30
    public static let heading2 = DSTextStyle(size: 17, weight: .semibold, lineHeight: 24) // Title 2, 17-24
    public static let heading2Medium = DSTextStyle(size: 16, weight: .medium, lineHeight: 20) // Title 3, 16-20
    public static let heading2Regular = DSTextStyle(size: 16, weight: .regular, lineHeight: 20) // Title 2, 16-20
    public static let caption = DSTextStyle(size: 13, weight: .regular, lineHeight: 16) // Caption, 13-16
}

public extension View {
    /// Applies a design system text style's font and line spacing.
    func dsTextStyle(_ style: DSTextStyle) -> some View {
        font(style.font)
            .lineSpacing(style.extraLineSpacing)
    }
}
