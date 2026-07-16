//
//  DSDetailRow.swift
//  DesignSystem
//
//  Created by Malky Shlomowitz on 15/07/2026.
//

import SwiftUI

/// A caption above a title with a divider underneath, for detail lists.
public struct DSDetailRow: View {

    private let caption: String
    private let title: String

    public init(caption: String, title: String) {
        self.caption = caption
        self.title = title
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(caption)
                .dsTextStyle(DSFonts.caption)
                .foregroundStyle(.secondary)

            Text(title)
                .dsTextStyle(DSFonts.heading2Medium)
                .foregroundStyle(DSColors.darkGrey)

            Divider()
                .padding(.top, 12)
        }
    }
}

#Preview {
    DSDetailRow(caption: "Caption", title: "Title")
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DSColors.lightGrey)
}
