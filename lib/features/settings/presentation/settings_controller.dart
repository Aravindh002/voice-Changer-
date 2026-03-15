import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsState {
  const SettingsState({required this.themeMode});
  final ThemeMode themeMode;

  SettingsState copyWith({ThemeMode? themeMode}) =>
      SettingsState(themeMode: themeMode ?? this.themeMode);
}

final settingsControllerProvider =
    StateNotifierProvider<SettingsController, SettingsState>(
  (ref) => SettingsController(),
);

class SettingsController extends StateNotifier<SettingsState> {
  SettingsController() : super(const SettingsState(themeMode: ThemeMode.system));

  void toggleTheme(bool dark) {
    state = state.copyWith(themeMode: dark ? ThemeMode.dark : ThemeMode.light);
  }
}
