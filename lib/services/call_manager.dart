import 'webrtc_service.dart';

class CallManager {
  CallManager(this._webRtcService);

  final WebRtcService _webRtcService;

  Future<void> placeCall(String number) async {
    await _webRtcService.connectCall(number);
  }

  Future<void> endCall() async {
    await _webRtcService.hangUp();
  }
}
