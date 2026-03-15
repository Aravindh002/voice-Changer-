import '../domain/auth_user.dart';

class AuthRepository {
  Future<AuthUser> loginAsGuest() async {
    return const AuthUser(id: 'guest_user', isGuest: true);
  }

  Future<AuthUser> loginWithPhone(String phone) async {
    return AuthUser(id: phone, isGuest: false);
  }
}
