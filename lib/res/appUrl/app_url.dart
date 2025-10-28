class AppUrl {
  static const String baseUrl = "http://192.168.1.24:4000/api/v1";
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
      "$baseUrl/recommendation-letter/transfer/create"; //done
  static const String createPostingLetterApi =
      "$baseUrl/recommendation-letter/posting/create"; //done
  static const String createQuarterAllotmentLetterApi =
      "$baseUrl/recommendation-letter/quarter-allotment/create"; //done
  static const String createAwardLetterApi =
      "$baseUrl/recommendation-letter/award/create"; //done
  static const String createAdmissionLetterApi =
      "$baseUrl/recommendation-letter/admission/create"; //done
  static const String createLandAllotmentLetterApi =
      "$baseUrl/recommendation-letter/land-allotment/create"; //done
  static const String createJobRecommendationLetterApi =
      "$baseUrl/recommendation-letter/job-recommendation/create"; //done
  static const String createFinancialRecommendationLetterApi =
      "$baseUrl/recommendation-letter/financial-recommendation/create";
  static const String createCulturalRecommendationLetterApi =
      "$baseUrl/recommendation-letter/cultural-programme/create";
  static const String createOtherRecommendationLetterApi =
      "$baseUrl/recommendation-letter/other-recommendation/create";

  //invitation
  static const String createInvitationApi = "$baseUrl/invitation/create"; //done

  //user profile
  static const String userProfile = "$baseUrl/me/profile"; //done

  static const String updateProfile = "$baseUrl/me/update-profile"; //done
}
