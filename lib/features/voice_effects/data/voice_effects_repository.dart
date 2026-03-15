import '../../../shared/models/voice_effect.dart';

class VoiceEffectsRepository {
  List<VoiceEffect> getEffects() => const [
        VoiceEffect(
          id: 'female',
          name: 'Female',
          description: 'Higher pitch and bright tone.',
          pitch: 1.25,
          robotize: false,
        ),
        VoiceEffect(
          id: 'male',
          name: 'Male',
          description: 'Natural masculine voice profile.',
          pitch: 0.9,
          robotize: false,
        ),
        VoiceEffect(
          id: 'kid',
          name: 'Kid',
          description: 'Playful high voice.',
          pitch: 1.45,
          robotize: false,
        ),
        VoiceEffect(
          id: 'robot',
          name: 'Robot',
          description: 'Metallic robotic synth overlay.',
          pitch: 1,
          robotize: true,
        ),
        VoiceEffect(
          id: 'alien',
          name: 'Alien',
          description: 'Unusual detuned spectral effect.',
          pitch: 1.1,
          robotize: true,
        ),
        VoiceEffect(
          id: 'deep',
          name: 'Deep Voice',
          description: 'Lower pitch cinematic style.',
          pitch: 0.7,
          robotize: false,
        ),
      ];
}
