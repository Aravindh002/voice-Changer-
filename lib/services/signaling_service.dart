import 'package:dio/dio.dart';

class SignalingService {
  SignalingService(this._dio);
  final Dio _dio;

  Future<void> registerSession() async {
    // API integration point.
    await Future<void>.delayed(const Duration(milliseconds: 250));
  }
}
