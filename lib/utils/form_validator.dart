class FormValidator {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (value.length != 10) {
      return 'Phone must be 10 digits';
    }
    return null;
  }

  // Add more validators as needed
  static String? validateRequired(String? value, String? fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validatePincode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Pincode is required';
    } else if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Enter a valid 6-digit pincode';
    }
    return null;
  }

  static String? validateAadhaar(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Aadhaar number is required';
    } else if (!RegExp(r'^\d{12}$').hasMatch(value)) {
      return 'Enter a valid 12-digit Aadhaar number';
    }
    return null;
  }

  static String? validateDob(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Date of Birth is required';
    }
    // Optionally add date format check
    return null;
  }

  static String? validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Email or Phone is required";
    }

    // Check if valid email
    if (RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return null;
    }

    // Check if valid phone (10 digits for India, adjust as needed)
    if (RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return null;
    }

    return "Enter a valid email or phone number";
  }

  static String? validateAddress(String? value) =>
      validateRequired(value, "Address");

  static String? validateDistrict(String? value) =>
      validateRequired(value, "District");

  static String? validateBlock(String? value) =>
      validateRequired(value, "Block");

  static String? validateCity(String? value) => validateRequired(value, "City");

  static String? validateWardNumber(String? value) =>
      validateRequired(value, "Ward number");

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!RegExp(r'^[a-zA-Z0-9]{6,}$').hasMatch(value)) {
      return 'Enter a valid password';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    } else if (value != value) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    } else if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return 'Enter a valid 6-digit OTP';
    }
    return null;
  }
}
