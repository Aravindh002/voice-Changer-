import '../shared/models/voice_effect.dart';
import 'voice_processing_service.dart';

class VoiceEffectEngine {
  VoiceEffectEngine(this._service);

  final VoiceProcessingService _service;

  Future<void> setEffect(VoiceEffect effect) async {
    await _service.applyEffect(effect);
  }
}
