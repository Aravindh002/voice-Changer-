import 'package:dio/dio.dart';

/// Backend gateway for future Firebase / Firestore / subscription APIs.
class BackendService {
  BackendService(this._dio);
  final Dio _dio;

  Future<void> syncUserProfile(String userId) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  Future<void> fetchSubscriptionStatus(String userId) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }
}
