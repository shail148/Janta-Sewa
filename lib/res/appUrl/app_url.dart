class AppUrl {
  static const String baseUrl =
      "https://janta-seva-backend.onrender.com/api/v1";
  static const String loginApi = "$baseUrl/auth/login";
  static const String registerApi = "$baseUrl/auth/register";
  static const String forgotPasswordApi = "$baseUrl/auth/forgot-Password";
  static const String verifyForgotOtpApi = "$baseUrl/auth/verify-forgot-otp";
  static const String resetPasswordApi = "$baseUrl/auth/reset-password";

  static const String getUserProfileApi = "$baseUrl/user/profile";
  static const String updateUserProfileApi = "$baseUrl/user/update-profile";
  static const String getUserServicesApi = "$baseUrl/user/services";
  static const String updateUserServicesApi = "$baseUrl/user/update-services";

  //railway ticket
  static const String ticketConfirmationApi = "$baseUrl/ticket/confirmation";
  static const String ticketPassengerApi = "$baseUrl/ticket/passenger";

  //parliament visit
  static const String parliamentVisitApi =
      "$baseUrl/parliament-visit/parliament-visit";
  //work demand
  static const String newWorkDemandApi = "$baseUrl/work-demand/new-work-demand";
  static const String pendingWorkDemandApi =
      "$baseUrl/work-demand/pending-work-demand";
  static const String beneficiaryOrientedApi =
      "$baseUrl/work-demand/beneficiary-oriented";
  //services  department
  static const String constructionWorkApi =
      "$baseUrl/services/construction-work";
  static const String hospitalAdmissionApi =
      "$baseUrl/services/hospital-admission";
  static const String letterRequestApi = "$baseUrl/services/letter-request";
  static const String lettersApi = "$baseUrl/services/letters";
  static const String recommendationLetterApi =
      "$baseUrl/services/recommendation-letter";
  static const String complainLetterApi = "$baseUrl/services/complain-letter";
  static const String complainOfGovEmployeeApi =
      "$baseUrl/services/complain-of-gov-employee";
  static const String complainOfPoliticianApi =
      "$baseUrl/services/complain-of-politician";
  static const String complainOfNationalApi =
      "$baseUrl/services/complain-of-national";
  static const String complainOfMpOfficeApi =
      "$baseUrl/services/complain-of-mp-office";
  static const String suggestionLetterApi =
      "$baseUrl/services/suggestion-letter";
  static const String budgetDemandApi = "$baseUrl/services/budget-demand";
  static const String contactApi = "$baseUrl/services/contact";
  static const String invitationApi = "$baseUrl/services/invitation";
}
