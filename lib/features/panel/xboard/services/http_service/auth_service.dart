// services/auth_service.dart
import 'package:hiddify/features/panel/xboard/services/http_service/http_service.dart';

class AuthService {
  final HttpService _httpService = HttpService();

  Future<Map<String, dynamic>> login(String email, String password) async {
    print("Email: $email, Password: $password");
    return await _httpService.postRequest(
      "/waf/passport/auth/login",
      {"email": email, "password": password},
      requiresHeaders: true,
    );
  }

  Future<Map<String, dynamic>> register(String email, String password, String inviteCode, String emailCode) async {
    return await _httpService.postRequest(
      "/waf/passport/auth/register",
      {
        "email": email,
        "password": password,
        "invite_code": inviteCode,
        "email_code": emailCode,
      },
    );
  }

  Future<Map<String, dynamic>> sendVerificationCode(String email) async {
    return await _httpService.postRequest(
      "/waf/passport/comm/sendEmailVerify",
      {'email': email},
    );
  }

  Future<Map<String, dynamic>> resetPassword(String email, String password, String emailCode) async {
    return await _httpService.postRequest(
      "/waf/passport/auth/forget",
      {
        "email": email,
        "password": password,
        "email_code": emailCode,
      },
    );
  }
}
