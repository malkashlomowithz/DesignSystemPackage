//
//  DSButtons.swift
//  DesignSystem
//
//  Created by Malky Shlomowitz on 15/07/2026.
//

import SwiftUI

/// Full-width primary action button. Renders in a lighter blue when disabled.
public struct DSPrimaryButtonStyle: ButtonStyle {

    @Environment(\.isEnabled) private var isEnabled

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .dsTextStyle(DSFonts.heading2)
            .foregroundStyle(DSColors.white)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(DSColors.primaryBlue.opacity(isEnabled ? 1 : 0.6), in: .rect(cornerRadius: 16))
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}

/// Circular icon button with a filled blue background.
public struct DSIconButtonStyle: ButtonStyle {

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .medium))
            .foregroundStyle(DSColors.white)
            .frame(width: 48, height: 48)
            .background(DSColors.primaryBlue, in: .circle)
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}

/// Circular icon button with a Liquid Glass background, for secondary actions.
public struct DSGreyIconButtonStyle: ButtonStyle {

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .medium))
            .frame(width: 48, height: 48)
            .glassEffect(.regular.interactive(), in: .circle)
    }
}

/// Borderless icon button tinted in the primary blue, for secondary actions.
public struct DSPlainIconButtonStyle: ButtonStyle {

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 22, weight: .regular))
            .foregroundStyle(DSColors.primaryBlue)
            .frame(width: 48, height: 48)
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
}

/// Bare icon button with no background, for back chevrons and disclosure arrows.
public struct DSBareIconButtonStyle: ButtonStyle {

    var size: CGFloat
    var color: Color

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size, weight: .semibold))
            .foregroundStyle(color)
            .frame(width: 44, height: 44)
            .contentShape(.rect)
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
}

public extension ButtonStyle where Self == DSPrimaryButtonStyle {
    static var dsPrimary: DSPrimaryButtonStyle { DSPrimaryButtonStyle() }
}

public extension ButtonStyle where Self == DSIconButtonStyle {
    static var dsIcon: DSIconButtonStyle { DSIconButtonStyle() }
}

public extension ButtonStyle where Self == DSGreyIconButtonStyle {
    static var dsIconGrey: DSGreyIconButtonStyle { DSGreyIconButtonStyle() }
}

public extension ButtonStyle where Self == DSPlainIconButtonStyle {
    static var dsIconPlain: DSPlainIconButtonStyle { DSPlainIconButtonStyle() }
}

public extension ButtonStyle where Self == DSBareIconButtonStyle {
    /// Dark navigation back chevron.
    static var dsBack: DSBareIconButtonStyle { DSBareIconButtonStyle(size: 22, color: DSColors.darkGrey) }

    /// Small grey disclosure chevron, e.g. expand/collapse arrows.
    static var dsChevron: DSBareIconButtonStyle { DSBareIconButtonStyle(size: 14, color: .secondary) }
}

#Preview {
    VStack(spacing: 24) {
        Button("Button") {}
            .buttonStyle(.dsPrimary)

        Button("Button") {}
            .buttonStyle(.dsPrimary)
            .disabled(true)

        HStack(spacing: 24) {
            Button {} label: { Image(systemName: "text.bubble.fill") }
                .buttonStyle(.dsIcon)
            Button {} label: { Image(systemName: "star") }
                .buttonStyle(.dsIcon)
            Button {} label: { Image(systemName: "arrow.clockwise") }
                .buttonStyle(.dsIcon)
            Button {} label: { Image(systemName: "xmark") }
                .buttonStyle(.dsIconGrey)
            Button {} label: { Image(systemName: "info.circle") }
                .buttonStyle(.dsIconPlain)
        }

        HStack(spacing: 16) {
            Button {} label: { Image(systemName: "chevron.left") }
                .buttonStyle(.dsBack)
            Button {} label: { Image(systemName: "chevron.up") }
                .buttonStyle(.dsChevron)
            Button {} label: { Image(systemName: "chevron.down") }
                .buttonStyle(.dsChevron)
        }
    }
    .padding(24)
    .background(DSColors.lightGrey)
}
