import '../../../shared/models/voice_effect.dart';
import '../data/voice_effects_repository.dart';

class GetVoiceEffectsUseCase {
  GetVoiceEffectsUseCase(this._repository);
  final VoiceEffectsRepository _repository;

  List<VoiceEffect> call() => _repository.getEffects();
}
