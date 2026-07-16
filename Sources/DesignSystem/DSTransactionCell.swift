//
//  DSTransactionCell.swift
//  DesignSystem
//
//  Created by Malky Shlomowitz on 15/07/2026.
//

import SwiftUI

/// A list cell for a single transaction: category icon, merchant and subtitle,
/// with the amount aligned to the trailing edge. Credits render in green with
/// an explicit plus sign; debits in dark grey.
public struct DSTransactionCell: View {

    private let title: String
    private let subtitle: String
    private let amount: Decimal
    private let currencyCode: String
    private let systemImage: String

    public init(
        _ title: String,
        subtitle: String,
        amount: Decimal,
        currencyCode: String = "GBP",
        systemImage: String = "creditcard.fill"
    ) {
        self.title = title
        self.subtitle = subtitle
        self.amount = amount
        self.currencyCode = currencyCode
        self.systemImage = systemImage
    }

    public var body: some View {
        HStack(spacing: 12) {
            Image(systemName: systemImage)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(DSColors.white)
                .frame(width: 44, height: 44)
                .background(DSColors.primaryBlue, in: .circle)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .dsTextStyle(DSFonts.heading2Medium)
                    .foregroundStyle(DSColors.darkGrey)
                    .lineLimit(1)

                Text(subtitle)
                    .dsTextStyle(DSFonts.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }

            Spacer(minLength: 12)

            Text(amount, format: .currency(code: currencyCode).sign(strategy: .always(showZero: false)))
                .dsTextStyle(DSFonts.heading2)
                .foregroundStyle(amount > 0 ? DSColors.successGreen : DSColors.darkGrey)
                .monospacedDigit()
        }
        .padding(16)
        .background(DSColors.white, in: .rect(cornerRadius: 20))
    }
}


#Preview {
    ScrollView {
        LazyVStack(spacing: 12) {
            DSTransactionCell(
                "Salary",
                subtitle: "Today, 9:41",
                amount: 2450,
                systemImage: "arrow.down"
            )
            DSTransactionCell(
                "Cash withdrawal",
                subtitle: "Yesterday",
                amount: -50,
                systemImage: "arrow.up"
            )
            DSTransactionCell(
                "To Sarah Cohen",
                subtitle: "Mon 13 Jul",
                amount: -120,
                systemImage: "arrow.left.arrow.right"
            )
            DSTransactionCell(
                "Pret A Manger",
                subtitle: "Sun 12 Jul",
                amount: -4.65,
                systemImage: "creditcard.fill"
            )
        }
        .padding(16)
    }
    .background(DSColors.lightGrey)
}
