import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/voice_effect_engine.dart';
import '../../../services/voice_processing_service.dart';
import '../../../shared/models/voice_effect.dart';
import '../data/voice_effects_repository.dart';
import '../domain/get_voice_effects_usecase.dart';

final voiceEffectsRepositoryProvider = Provider<VoiceEffectsRepository>((ref) => VoiceEffectsRepository());
final getVoiceEffectsProvider = Provider<GetVoiceEffectsUseCase>(
  (ref) => GetVoiceEffectsUseCase(ref.read(voiceEffectsRepositoryProvider)),
);

final voiceProcessingServiceProvider = Provider<VoiceProcessingService>((ref) {
  final service = VoiceProcessingService();
  ref.onDispose(service.dispose);
  return service;
});

final voiceEffectEngineProvider = Provider<VoiceEffectEngine>(
  (ref) => VoiceEffectEngine(ref.read(voiceProcessingServiceProvider)),
);

final selectedVoiceEffectProvider = StateProvider<VoiceEffect?>((ref) => null);

final availableVoiceEffectsProvider = Provider<List<VoiceEffect>>(
  (ref) => ref.read(getVoiceEffectsProvider).call(),
);
