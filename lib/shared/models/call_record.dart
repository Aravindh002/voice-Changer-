class CallRecord {
  const CallRecord({
    required this.number,
    required this.duration,
    required this.timestamp,
    required this.effectName,
  });

  final String number;
  final Duration duration;
  final DateTime timestamp;
  final String effectName;
}
