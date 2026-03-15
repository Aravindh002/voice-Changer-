import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/glass_card.dart';
import '../../../shared/models/voice_effect.dart';
import 'voice_effects_controller.dart';

class VoiceEffectsScreen extends ConsumerWidget {
  const VoiceEffectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effects = ref.watch(availableVoiceEffectsProvider);
    final selected = ref.watch(selectedVoiceEffectProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Voice Effects')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: effects.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) {
          final effect = effects[index];
          final isSelected = selected?.id == effect.id;
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _selectEffect(ref, effect),
            child: GlassCard(
              child: Row(
                children: [
                  Icon(Icons.multitrack_audio, color: isSelected ? Theme.of(context).colorScheme.primary : null),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(effect.name, style: Theme.of(context).textTheme.titleMedium),
                        Text(effect.description),
                      ],
                    ),
                  ),
                  Icon(isSelected ? Icons.check_circle : Icons.play_circle_fill),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _selectEffect(WidgetRef ref, VoiceEffect effect) async {
    ref.read(selectedVoiceEffectProvider.notifier).state = effect;
    await ref.read(voiceEffectEngineProvider).setEffect(effect);
  }
}
