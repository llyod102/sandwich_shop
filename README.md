# sandwich_shop

A simple Flutter demo app for choosing and counting sandwiches.

## Overview

This small app demonstrates a simple order UI where a user can:

- Choose sandwich size (footlong or 6-inch) using a switch
- Select a bread type from a dropdown
- Add an order note
- Increase / decrease the current order quantity using styled buttons
- See the current order summary (quantity, bread type, notes)

The app is intentionally small and focused so you can extend it easily.

## Key Files

- `lib/main.dart` — Main app UI and logic. Contains `OrderScreen`, `OrderItemDisplay`, and `StyledButton`.
- `lib/views/app_styles.dart` — Centralized text styles used in the app (imported by `main.dart`).
- `lib/repositories/order_repository.dart` — Simple repository used to manage quantity and business rules (max/min checks).

If you add new widgets, consider placing them under `lib/widgets/`.

## Features (what the code implements)

- `OrderScreen` (stateful):
	- A `Switch` toggles between `six-inch` and `footlong` sandwich sizes.
	- A `DropdownMenu<BreadType>` selects the bread type (`white`, `wheat`, `wholemeal`).
	- A `TextField` for order notes. Notes are shown under the order summary.
	- Two `StyledButton` instances (Add / Remove) that use a shared button style and update quantity via `OrderRepository`.
- `OrderItemDisplay` shows a summary line and the current note.

## Requirements

- Flutter SDK (stable channel recommended)
- Dart (bundled with Flutter)

## Setup (Windows / PowerShell)

Open PowerShell in the project root (the folder that contains `pubspec.yaml`) and run:

```powershell
flutter pub get
flutter analyze
flutter run
```

Notes:
- If you target a specific device or emulator, use `flutter run -d <device-id>`.
- Run `flutter doctor` if you have environment issues.

## How the UI works

- Sandwich size: A `Switch` in the UI toggles `_isFootlong` in `OrderScreen`. The `OrderItemDisplay` reads that state and displays `footlong` or `six-inch` accordingly.
- Bread type: A `DropdownMenu<BreadType>` uses the `BreadType` enum and `DropdownMenuEntry` values to let the user pick a bread. Selection updates local state and is displayed in the order summary.
- Notes: A `TextField` bound to a `TextEditingController` with a listener — when the text changes, the UI is rebuilt and the note is shown under the order summary.
- Quantity buttons: The `OrderRepository` encapsulates increment/decrement logic and bounds checking. The UI calls `_getIncreaseCallback()` / `_getDecreaseCallback()` which return `VoidCallback?` or `null` when disabled. `StyledButton` consumes these callbacks and visually disables the button when necessary.

## Extending the app

- Move `StyledButton` to `lib/widgets/styled_button.dart` for re-use.
- Add persistence (e.g., `shared_preferences`) to remember last order.
- Replace text emojis with icons or images for a richer UI.
- Add form validation for notes and custom sandwich options.

## Troubleshooting

- If you see errors about missing imports (e.g., `views/app_styles.dart`), ensure the file exists and update the import path as needed.
- If `flutter analyze` reports button style API deprecations, prefer `ButtonStyle` + `MaterialStateProperty` or update to the `styleFrom` parameters appropriate for your Flutter SDK version.

## Helpful commands

```powershell
# Get dependencies
flutter pub get

# Analyze
flutter analyze

# Run on connected device or emulator
flutter run

# Build APK
flutter build apk --release
```

---

