import 'package:anantla_pay/src/core/main/controllers/add_wish_list/add_wish_list_provider.dart';
import 'package:anantla_pay/src/core/main/controllers/forgot_password/forgot_password_provider.dart';
import 'package:anantla_pay/src/core/main/controllers/login/login_provider.dart';
import 'package:anantla_pay/src/core/main/controllers/logout/logout_provider.dart';
import 'package:anantla_pay/src/core/main/controllers/notification_service/notification_services.dart';
import 'package:anantla_pay/src/core/main/controllers/register/register_provider.dart';
import 'package:anantla_pay/src/core/main/controllers/verifOtp/verifOtpLogin_provider.dart';
import 'package:anantla_pay/src/core/main/domain/entities/login_model.dart';
import 'package:anantla_pay/src/core/main/domain/entities/otp_params.dart';
import 'package:anantla_pay/src/core/main/domain/entities/register_param.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/add_wish_list.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/forgot_password.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/login.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/register.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/verifOtpLogin.dart';
import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/presentation/main/controllers/selected_index_provider.dart';
import 'package:anantla_pay/src/presentation/main/controllers/user_id_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> login({
    required String email,
    required String password,
    required Function(LoginModel) onSuccess,
    required Function(String message) onError,
  }) async {
    state = const AsyncLoading();
    ref.invalidate(selectedIndexProvider);
    NotificationService notificationService = NotificationService();
    final fcmToken = await notificationService.getToken();
    print('FCM Token: $fcmToken');
    Login login = await ref.read(loginProvider);
    final result = await login(LoginParams(
        email: email, password: password, fcmToken: fcmToken ?? ''));
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) async {
        TokenManager tokenManager = await ref.read(tokenManagerProvider.future);
        await tokenManager.saveToken(data.token ?? '');
        await tokenManager.saveUserId(data.user!.userId!);
        final user = tokenManager.isLogin();

        final userId = await tokenManager.getUserId();
        print('User ID: $userId');
        onSuccess(data);
        // ref
        //     .read(routerProvider)
        //     .pushReplacementNamed(RouteName.main, extra: data.user!.userId);
        state = AsyncData('Login Success');
      },
    );
  }

  Future<void> verifOtpLogin({
    required OtpParams params,
    required Function() onSuccess,
    required Function() onError,
  }) async {
    state = const AsyncLoading();

    VerifOtpLogin verifOtpLogin = await ref.read(verifOtpLoginProvider);
    final result = await verifOtpLogin(OtpParams(
      otpCode: params.otpCode,
      email: params.email,
    ));

    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError();
      },
      (data) async {
        TokenManager tokenManager = await ref.read(tokenManagerProvider.future);
        await tokenManager.saveToken(data.token ?? '');
        await tokenManager.saveUserId(data.user!.userId!);
        final user = await tokenManager.isLogin();

        print('User: $user');
        onSuccess();

        state = AsyncData('Verif Otp Success');
      },
    );
  }

  Future<void> logout({
    required Function() onSuccess,
    required Function() onError,
  }) async {
    state = const AsyncLoading();
    final logout = ref.read(logoutProvider);
    final result = await logout.call(null);
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError();
      },
      (data) async {
        TokenManager tokenManager = await ref.read(tokenManagerProvider.future);
        await tokenManager.removeToken();

        await tokenManager.removeUserId();
        onSuccess();
        state = AsyncData('Logout Success');
      },
    );
  }

  Future<void> register({
    required RegisterParams params,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      state = const AsyncLoading();
      Register register = await ref.read(registerProvider);
      final result = await register(RegisterParams(
        email: params.email,
        username: params.username,
        phone: params.phone,
        clientId: params.clientId,
        countryCode: params.countryCode,
      ));
      result.fold(
        (error) {
          state = AsyncError(error, StackTrace.current);
          onError(error);
        },
        (data) async {
          onSuccess(data);
          state = AsyncData('Register Success');
        },
      );
    } catch (e, stackTrace) {
      // Tangani error tidak terduga
      print('Error saat logout: $e');
      print('StackTrace: $stackTrace');
      state = AsyncError(e, stackTrace);
      onError(e.toString());
    }
  }

  Future<void> forgotPassword({
    required RegisterParams params,
    required Function(String message) onSuccess,
    required Function() onError,
  }) async {
    try {
      state = const AsyncLoading();
      ForgotPassword forgotPassword = await ref.read(forgotPasswordProvider);
      final result = await forgotPassword(RegisterParams(
        email: params.email,
        username: params.username,
        phone: params.phone,
        clientId: params.clientId,
        countryCode: params.countryCode,
      ));
      result.fold(
        (error) {
          state = AsyncError(error, StackTrace.current);
          onError();
        },
        (data) async {
          onSuccess(data);
          state = AsyncData('Forgot Password Success');
        },
      );
    } catch (e, stackTrace) {
      // Tangani error tidak terduga
      print('Error saat logout: $e');
      print('StackTrace: $stackTrace');
      state = AsyncError(e, stackTrace);
      onError();
    }
  }

  Future<void> addWishList({
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    state = const AsyncLoading();
    AddWishList addWishList = await ref.read(addWishListProvider);
    final result = await addWishList.call(null);
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) async {
        onSuccess(data);
        state = AsyncData('Add Wish List Success');
      },
    );
  }
}
