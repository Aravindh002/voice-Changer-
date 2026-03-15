import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/models/call_record.dart';
import '../../history/presentation/history_controller.dart';
import '../../voice_effects/presentation/voice_effects_controller.dart';
import 'call_controller.dart';

class CallScreen extends ConsumerWidget {
  const CallScreen({required this.number, super.key});

  final String number;

  String _format(Duration d) => [d.inMinutes.remainder(60), d.inSeconds.remainder(60)]
      .map((v) => v.toString().padLeft(2, '0'))
      .join(':');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final call = ref.watch(callControllerProvider);
    final selectedEffect = ref.watch(selectedVoiceEffectProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF261A4A), Color(0xFF0E1838)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 56)),
                const SizedBox(height: 16),
                Text(number, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    _format(call.elapsed),
                    key: ValueKey(call.elapsed.inSeconds),
                    style: const TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  selectedEffect?.name ?? 'No effect selected',
                  style: const TextStyle(color: Colors.white70),
                ),
                const Spacer(),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    _CallActionButton(
                      label: 'Mute',
                      icon: call.isMuted ? Icons.mic_off : Icons.mic,
                      onTap: () => ref.read(callControllerProvider.notifier).toggleMute(),
                    ),
                    _CallActionButton(
                      label: 'Speaker',
                      icon: call.isSpeakerOn ? Icons.volume_up : Icons.volume_down,
                      onTap: () => ref.read(callControllerProvider.notifier).toggleSpeaker(),
                    ),
                    _CallActionButton(
                      label: 'Effect',
                      icon: Icons.auto_awesome,
                      onTap: () => context.push('/effects'),
                    ),
                    _CallActionButton(
                      label: 'End',
                      icon: Icons.call_end,
                      danger: true,
                      onTap: () {
                        ref.read(callControllerProvider.notifier).endCall();
                        ref.read(callHistoryProvider.notifier).update(
                              (state) => [
                                CallRecord(
                                  number: number,
                                  duration: call.elapsed,
                                  timestamp: DateTime.now(),
                                  effectName: selectedEffect?.name ?? 'None',
                                ),
                                ...state,
                              ],
                            );
                        context.pop();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CallActionButton extends StatelessWidget {
  const _CallActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
    this.danger = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          heroTag: '$label-btn',
          backgroundColor: danger ? Colors.redAccent : Colors.white24,
          onPressed: onTap,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}
