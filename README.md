# DesignSystem

A SwiftUI design system package providing shared colors, typography, buttons, and components for building consistent iOS interfaces.

## Requirements

- iOS 26+
- Swift 6.3+ (tools), Swift 6 language mode

## Installation

Add the package as a local or remote dependency in your `Package.swift`:

```swift
dependencies: [
    .package(path: "../DesignSystem")
]
```

Then add `DesignSystem` to your target's dependencies:

```swift
.target(
    name: "YourApp",
    dependencies: ["DesignSystem"]
)
```

## Usage

```swift
import DesignSystem

Text("Hello")
    .dsTextStyle(DSFonts.heading2)
    .foregroundStyle(DSColors.darkGrey)
```

## What's included

### Colors — `DSColors`

Static color palette: `darkGrey`, `primaryBlue`, `successGreen`, `lightGrey`, `white`.

### Typography — `DSFonts`

Text styles (`heading1`, `heading2`, `heading2Medium`, `heading2Regular`, `caption`) defined as size, weight, and line height. Apply with the `.dsTextStyle(_:)` view modifier.

### Buttons — `DSButtons`

`ButtonStyle`s for common button variants:

- `.dsPrimary` — full-width primary action button
- `.dsIcon` — circular filled icon button
- `.dsIconGrey` — circular Liquid Glass icon button
- `.dsIconPlain` — borderless tinted icon button
- `.dsBack` / `.dsChevron` — bare navigation chevrons

### Components

- **`DSActionCard`** — tappable card with a circular icon and caption
- **`DSDetailRow`** — caption/title pair with a divider, for detail lists
- **`DSFieldRow`** — caption above editable content (e.g. `TextField`), with a divider
- **`DSSuccessBadge`** — green checkmark badge confirming a successful action
- **`DSTransactionCell`** — list cell for a transaction: icon, title/subtitle, and signed currency amount

Each component includes an Xcode `#Preview` for quick visual reference.
