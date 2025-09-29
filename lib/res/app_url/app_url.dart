class AppUrl {
  static const String baseUrl =
      "https://janta-seva-backend.onrender.com/api/v1";
  static const String loginApi = "$baseUrl/auth/login";
  static const String registerApi = "$baseUrl/auth/register";
  static const String forgotPasswordApi = "$baseUrl/auth/forgot-Password";
  static const String verifyForgotOtpApi = "$baseUrl/auth/verify-forgot-otp";
  static const String resetPasswordApi = "$baseUrl/auth/reset-password";
}
