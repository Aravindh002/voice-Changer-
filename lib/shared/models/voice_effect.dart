class VoiceEffect {
  const VoiceEffect({
    required this.id,
    required this.name,
    required this.description,
    required this.pitch,
    required this.robotize,
  });

  final String id;
  final String name;
  final String description;
  final double pitch;
  final bool robotize;
}
