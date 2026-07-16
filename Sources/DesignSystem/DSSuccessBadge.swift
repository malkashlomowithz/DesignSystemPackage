//
//  DSSuccessBadge.swift
//  DesignSystem
//
//  Created by Malky Shlomowitz on 15/07/2026.
//

import SwiftUI

/// A green circle with a white checkmark, shown to confirm a successful action.
/// Optionally displays a label beneath the checkmark.
public struct DSSuccessBadge: View {

    private let label: String?

    public init(label: String? = nil) {
        self.label = label
    }

    public var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark")
                .font(.system(size: 15, weight: .semibold))
                .padding(2)
                .foregroundStyle(DSColors.white)
                .background(DSColors.successGreen, in: .circle)
            if let label {
                Text(label)
                    .dsTextStyle(DSFonts.heading2Medium)
                    .foregroundStyle(DSColors.darkGrey)
            }
        }
        .padding(7)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(DSColors.successGreen, lineWidth: 1)
        }
    }
}

#Preview {
    DSSuccessBadge(label: "Saved")
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DSColors.lightGrey)
}
