# Magic Voice Changer

A Flutter (Dart 3) production-oriented prank voice call app scaffold using:

- Feature-first clean architecture
- Riverpod state management
- go_router navigation
- Material 3 dynamic theming
- Voice processing service abstraction for real-time effects

## Run

```bash
flutter pub get
flutter run
```

## Implemented Features

- Splash animation
- Authentication (phone / guest mock)
- Home dashboard (credits + quick actions)
- Dial pad and call flow
- Real-time call controls (mute, speaker, effect, end)
- Voice effects listing and selection
- Wallet credits system
- Call history tracking
- Settings (theme, about, privacy)

## Architecture

```text
lib/
├── core/
├── features/
├── services/
└── shared/
```

This scaffold is backend-ready for Firebase Auth, Firestore, and subscriptions via service layer adapters.
