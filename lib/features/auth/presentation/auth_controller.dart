import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/data/auth_repository.dart';
import '../../auth/domain/auth_user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository());

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<AuthUser?>>(
  (ref) => AuthController(ref.read(authRepositoryProvider)),
);

class AuthController extends StateNotifier<AsyncValue<AuthUser?>> {
  AuthController(this._repository) : super(const AsyncValue.data(null));

  final AuthRepository _repository;

  Future<void> loginGuest() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_repository.loginAsGuest);
  }

  Future<void> loginPhone(String phone) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _repository.loginWithPhone(phone));
  }

  void logout() => state = const AsyncValue.data(null);
}
