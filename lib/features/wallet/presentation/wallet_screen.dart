import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/primary_button.dart';
import 'wallet_controller.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credits = ref.watch(creditsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Available credits: $credits minutes', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Buy 30 Minutes',
              icon: Icons.add_shopping_cart,
              onPressed: () => ref.read(creditsProvider.notifier).update((state) => state + 30),
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              label: 'Buy 60 Minutes',
              icon: Icons.workspace_premium,
              onPressed: () => ref.read(creditsProvider.notifier).update((state) => state + 60),
            ),
          ],
        ),
      ),
    );
  }
}
