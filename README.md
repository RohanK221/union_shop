# Union Shop

A Flutter app for the University of Portsmouth union shop. The app showcases product collections, individual product pages, and simple navigation for browsing clothing, stationery, and accessories.

Key features
- Browse collections (Clothing, Stationery, Accessories)
- Product detail pages and responsive layout
- Reusable layout and product card widgets
- Unit/widget tests for core screens

## Quick links (open these files in this workspace)
- [lib/main.dart](lib/main.dart) — app entry, contains the [`UnionShopApp`](lib/main.dart) widget.
- [lib/pages/collection_page.dart](lib/pages/collection_page.dart) — contains the [`CollectionPage`](lib/pages/collection_page.dart) screen.
- [lib/widgets/layout.dart](lib/widgets/layout.dart) — contains the [`MainLayout`](lib/widgets/layout.dart) reusable scaffold and navigation.
- [lib/widgets/product_card.dart](lib/widgets/product_card.dart) — product list card widget (referenced in `main.dart`).
- [pubspec.yaml](pubspec.yaml) — dependencies and assets configuration.
- [test/home_test.dart](test/home_test.dart) — tests verifying home screen content.
- [test/pages/aboutus_page_test.dart](test/pages/aboutus_page_test.dart) — navigation test for About Us page.
- [android/app/src/main/AndroidManifest.xml](android/app/src/main/AndroidManifest.xml)
- [ios/Runner/Info.plist](ios/Runner/Info.plist)
- [web/index.html](web/index.html)

## Installation & setup

Prerequisites
- Flutter SDK (stable) and matching Dart SDK (see [pubspec.yaml](pubspec.yaml) environment)
- Android Studio / Xcode for mobile builds (or appropriate platform tooling)
- Git

Clone repository
```bash
git clone RohanK221/union_shop
cd union_shop
```

Install dependencies
```bash
flutter pub get
```

Run on a device or emulator
- List devices:
```bash
flutter devices
```
- Run:
```bash
flutter run
```
To run on web:
```bash
flutter run -d chrome
```

Build release
```bash
flutter build apk      # Android
flutter build ios      # iOS (requires Xcode)
flutter build web
```

## Usage

Main flows
- Launch the app (see [`UnionShopApp`](lib/main.dart)) to reach the home screen.
- Open "Collections" to see [`CollectionPage`](lib/pages/collection_page.dart) which navigates to category routes (e.g. `/shop/clothing`).
- App shell and navigation provided by [`MainLayout`](lib/widgets/layout.dart).

Configuration
- Add or update assets in `assets/images/...` and ensure `pubspec.yaml` lists them (already configured).
- Update app metadata for platform builds in:
  - [android/app/src/main/AndroidManifest.xml](android/app/src/main/AndroidManifest.xml)
  - [ios/Runner/Info.plist](ios/Runner/Info.plist)
  - [web/index.html](web/index.html)

Running tests
```bash
flutter test
```
See widget tests:
- [test/home_test.dart](test/home_test.dart)
- [test/pages/aboutus_page_test.dart](test/pages/aboutus_page_test.dart)

Screenshots / GIFs
- Add screenshots to this README by placing images in `assets/images/` (or `assets/screenshots/`) and embedding them here (Markdown):
  - ![screenshot](assets/images/anchordesign/blackhoodie.png)

## Project structure & technologies

Top-level
- lib/ — app source
  - [lib/main.dart](lib/main.dart) — entry point
  - [lib/pages/collection_page.dart](lib/pages/collection_page.dart) — collections screen
  - [lib/widgets/layout.dart](lib/widgets/layout.dart) — app scaffold and nav
  - [lib/widgets/product_card.dart](lib/widgets/product_card.dart) — reusable product card
- test/ — unit & widget tests: [test/home_test.dart](test/home_test.dart), [test/pages/aboutus_page_test.dart](test/pages/aboutus_page_test.dart)
- android/, ios/, macos/, linux/, windows/, web/ — platform configs and build files
- pubspec.yaml — dependencies (Flutter, cupertino_icons, dev_dependencies include `flutter_test`, `network_image_mock`, `flutter_lints`)

Dependencies (from [pubspec.yaml](pubspec.yaml))
- flutter (SDK)
- cupertino_icons
Dev dependencies:
- flutter_test
- network_image_mock
- flutter_lints

Development tips
- Use hot reload during UI changes: press "r" in the terminal running `flutter run`.
- Tests use `network_image_mock` to stub network images in widget tests.

Contributing
- Fork, create a feature branch, add tests, and open a pull request.

License
- Add your license and copyright information (update `macos/Runner/Configs/AppInfo.xcconfig` and platform metadata if needed).

Contact Details:
Student email - up2210014@myport.ac.uk

