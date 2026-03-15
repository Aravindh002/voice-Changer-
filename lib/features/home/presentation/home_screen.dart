import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/primary_button.dart';
import '../../wallet/presentation/wallet_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credits = ref.watch(creditsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magic Voice Changer'),
        actions: [
          IconButton(onPressed: () => context.push('/settings'), icon: const Icon(Icons.settings))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GlassCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Credits Balance', style: Theme.of(context).textTheme.titleMedium),
                Chip(label: Text('$credits min')),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(label: 'Start Call', icon: Icons.dialpad, onPressed: () => context.push('/dialpad')),
          const SizedBox(height: 12),
          PrimaryButton(label: 'Voice Effects', icon: Icons.graphic_eq, onPressed: () => context.push('/effects')),
          const SizedBox(height: 12),
          PrimaryButton(label: 'Call History', icon: Icons.history, onPressed: () => context.push('/history')),
          const SizedBox(height: 12),
          PrimaryButton(label: 'Wallet', icon: Icons.account_balance_wallet, onPressed: () => context.push('/wallet')),
        ],
      ),
    );
  }
}
