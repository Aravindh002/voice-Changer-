import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'history_controller.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(callHistoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Call History')),
      body: history.isEmpty
          ? const Center(child: Text('No calls yet.'))
          : ListView.separated(
              itemCount: history.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) {
                final item = history[i];
                return ListTile(
                  leading: const Icon(Icons.call),
                  title: Text(item.number),
                  subtitle: Text('${item.effectName} • ${item.duration.inSeconds}s'),
                  trailing: Text('${item.timestamp.hour}:${item.timestamp.minute.toString().padLeft(2, '0')}'),
                );
              },
            ),
    );
  }
}
