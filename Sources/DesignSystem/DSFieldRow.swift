//
//  DSFieldRow.swift
//  DesignSystem
//
//  Created by Malky Shlomowitz on 15/07/2026.
//

import SwiftUI

/// A caption above arbitrary content with a divider underneath, for editable
/// detail lists. The content is typically a `TextField` or `Picker`.
public struct DSFieldRow<Content: View>: View {

    private let caption: String
    private let editable: Bool
    private let content: Content

    public init(caption: String, editable: Bool = false, @ViewBuilder content: () -> Content) {
        self.caption = caption
        self.editable = editable
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(caption)
                .dsTextStyle(DSFonts.caption)
                .foregroundStyle(.secondary)

            HStack(spacing: 8) {
                content

                if editable {
                    Image(systemName: "pencil.line")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.secondary)
                        .accessibilityHidden(true)
                }
            }

            Divider()
                .padding(.top, 12)
        }
    }
}

#Preview {
    @Previewable @State var text = "Title"

    DSFieldRow(caption: "Caption", editable: true) {
        TextField("Placeholder", text: $text)
            .dsTextStyle(DSFonts.heading2Medium)
            .foregroundStyle(DSColors.darkGrey)
    }
    .padding(24)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(DSColors.lightGrey)
}
