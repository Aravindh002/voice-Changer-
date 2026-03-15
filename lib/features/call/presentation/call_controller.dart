import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CallState {
  const CallState({
    required this.isMuted,
    required this.isSpeakerOn,
    required this.elapsed,
    required this.isActive,
  });

  final bool isMuted;
  final bool isSpeakerOn;
  final Duration elapsed;
  final bool isActive;

  CallState copyWith({bool? isMuted, bool? isSpeakerOn, Duration? elapsed, bool? isActive}) {
    return CallState(
      isMuted: isMuted ?? this.isMuted,
      isSpeakerOn: isSpeakerOn ?? this.isSpeakerOn,
      elapsed: elapsed ?? this.elapsed,
      isActive: isActive ?? this.isActive,
    );
  }
}

final callControllerProvider = StateNotifierProvider.autoDispose<CallController, CallState>(
  (ref) => CallController(),
);

class CallController extends StateNotifier<CallState> {
  CallController()
      : super(const CallState(isMuted: false, isSpeakerOn: false, elapsed: Duration.zero, isActive: true)) {
    _startTimer();
  }

  Timer? _timer;

  void toggleMute() => state = state.copyWith(isMuted: !state.isMuted);

  void toggleSpeaker() => state = state.copyWith(isSpeakerOn: !state.isSpeakerOn);

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = state.copyWith(elapsed: state.elapsed + const Duration(seconds: 1));
    });
  }

  void endCall() {
    _timer?.cancel();
    state = state.copyWith(isActive: false);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
