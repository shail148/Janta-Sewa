class AppUrl {
  static const String baseUrl = "http://192.168.1.31:4000/api/v1";
  static const String loginApi = "$baseUrl/auth/login";
  static const String registerApi = "$baseUrl/auth/register";
  static const String forgotPasswordApi = "$baseUrl/forgotPassword";
  static const String verifyForgotOtpApi = "$baseUrl/verify-forgot-otp";
  static const String resetPasswordApi = "$baseUrl/reset-password";
}
