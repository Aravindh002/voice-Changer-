import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            value: settings.themeMode == ThemeMode.dark,
            onChanged: (v) => ref.read(settingsControllerProvider.notifier).toggleTheme(v),
            title: const Text('Dark mode'),
          ),
          const AboutListTile(
            icon: Icon(Icons.info_outline),
            applicationName: 'Magic Voice Changer',
            applicationVersion: '1.0.0',
          ),
          const ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text('Privacy'),
            subtitle: Text('Your calls and profile data are protected by encryption at rest.'),
          ),
        ],
      ),
    );
  }
}
