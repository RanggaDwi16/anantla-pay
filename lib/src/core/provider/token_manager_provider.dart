import 'package:anantla_pay/src/core/provider/shared_pref_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'token_manager_provider.g.dart';

@riverpod
Future<TokenManager> tokenManager(TokenManagerRef ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  return TokenManager(sharedPreferences: sharedPreferences);
}

class TokenManager {
  final SharedPreferences sharedPreferences;

  TokenManager({required this.sharedPreferences});

  Future<void> saveToken(String token) async {
    await sharedPreferences.setString('access_token', token);
  }

  Future<void> saveTokenVirtualAccount(String token) async {
    await sharedPreferences.setString('access_token_virtual_account', token);
  }

  Future<void> saveUserId(int userId) async {
    await sharedPreferences.setInt('user_id', userId);
  }

  Future<void> saveRole(String role) async {
    await sharedPreferences.setString('role', role);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString('access_token');
  }

  Future<String?> getTokenVirtualAccount() async {
    return sharedPreferences.getString('access_token_virtual_account');
  }

  Future<int?> getUserId() async {
    return sharedPreferences.getInt('user_id');
  }

  Future<void> removeToken() async {
    await sharedPreferences.remove('access_token');
  }

  Future<void> removeTokenVirtualAccount() async {
    await sharedPreferences.remove('access_token_virtual_account');
  }

  Future<void> removeUserId() async {
    await sharedPreferences.remove('user_id');
  }

  Future<void> removeData() async {
    await removeToken();
    await removeUserId();
    await removeTokenVirtualAccount();
    await removeFingerprintEnabled();
  }

  Future<bool> isLogin() async {
    final token = await getToken();
    final userId = await getUserId();
    if (token == null && userId == null) {
      return false;
    }
    return true;
  }

  static const String _onboardingKey = 'onboardingCompleted';

  /// **🔹 Simpan status bahwa onboarding telah selesai**
  Future<void> setOnboardingCompleted() async {
    await sharedPreferences.setBool(_onboardingKey, true);
  }

  /// **🔹 Periksa apakah onboarding sudah selesai**
  bool isOnboardingCompleted() {
    return sharedPreferences.getBool(_onboardingKey) ?? false;
  }

  // Tambahan baru untuk fingerprint / face ID
  static const String _fingerprintKey = 'fingerprintEnabled';

  /// Simpan apakah user mengaktifkan fingerprint
  Future<void> setFingerprintEnabled(bool enabled) async {
    await sharedPreferences.setBool(_fingerprintKey, enabled);
  }

  /// Ambil status apakah fingerprint aktif
  Future<bool> isFingerprintEnabled() async {
    return sharedPreferences.getBool(_fingerprintKey) ?? false;
  }

  /// Hapus setting fingerprint (misal saat logout)
  Future<void> removeFingerprintEnabled() async {
    await sharedPreferences.remove(_fingerprintKey);
  }
}
