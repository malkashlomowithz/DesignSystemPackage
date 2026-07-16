//
//  DSActionCard.swift
//  DesignSystem
//
//  Created by Malky Shlomowitz on 15/07/2026.
//

import SwiftUI

/// A tappable white card with a circular icon above a caption, e.g. "Open receipt".
public struct DSActionCard: View {

    private let title: String
    private let systemImage: String
    private let action: () -> Void

    public init(_ title: String, systemImage: String, action: @escaping () -> Void) {
        self.title = title
        self.systemImage = systemImage
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            VStack(spacing: 12) {
                Image(systemName: systemImage)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(DSColors.white)
                    .frame(width: 48, height: 48)
                    .background(DSColors.primaryBlue, in: .circle)

                Text(title)
                    .dsTextStyle(DSFonts.heading2Regular)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(24)
            .background(DSColors.white, in: .rect(cornerRadius: 24))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    DSActionCard("Open receipt", systemImage: "text.bubble.fill") {}
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DSColors.lightGrey)
}
