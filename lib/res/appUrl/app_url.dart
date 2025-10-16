class AppUrl {
  static const String baseUrl =
      "https://janta-seva-backend.onrender.com/api/v1";
  static const String loginApi = "$baseUrl/auth/login"; //done
  static const String registerApi = "$baseUrl/auth/register"; //done
  static const String forgotPasswordApi = "$baseUrl/auth/forgot-Password"; //d
  static const String verifyForgotOtpApi =
      "$baseUrl/auth/verify-forgot-otp"; //done
  static const String resetPasswordApi = "$baseUrl/auth/reset-password"; //done

  //service department

  static const String createRailTicketApi =
      "$baseUrl/services-department/train-ticket-confirmation/train-ticket-request";

  static const String parliamentVisitApi =
      "$baseUrl/services-department/parliament-visit/parliament-visit-request"; //done
  //hospital admission
  static const String createhospitalAdmissionApi =
      "$baseUrl/services-department/hospital-admission/create"; //done
  //parliament visit

  //Recommendation letter
  static const String createTransferLetterApi =
      "$baseUrl/recommendation-letter/transfer/create";
  static const String createPostingLetterApi =
      "$baseUrl/recommendation-letter/transfer-letter/create";
  static const String createQuarterAllotmentLetterApi =
      "$baseUrl/recommendation-letter/transfer-letter/create";
  static const String createAwardLetterApi =
      "$baseUrl/recommendation-letter/transfer-letter/create";
  static const String createAdmissionLetterApi =
      "$baseUrl/recommendation-letter/transfer-letter/create";
  static const String createLandAllotmentLetterApi =
      "$baseUrl/recommendation-letter/transfer-letter/create";
  static const String createJobRecommendationLetterApi =
      "$baseUrl/recommendation-letter/transfer-letter/create";
  static const String createFinancialRecommendationLetterApi =
      "$baseUrl/recommendation-letter/transfer-letter/create";
  static const String createCulturalRecommendationLetterApi =
      "$baseUrl/recommendation-letter/transfer-letter/create";
  static const String createOtherRecommendationLetterApi =
      "$baseUrl/recommendation-letter/transfer-letter/create";
}
