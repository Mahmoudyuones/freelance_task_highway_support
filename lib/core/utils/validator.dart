class Validators {
  static String? isValidIDCardNumber(String? val) {
    final RegExp idRegex = RegExp(r'^\d{14}$');
    if (val == null || val.isEmpty) {
      return "This Field is required";
    } else if (!idRegex.hasMatch(val)) {
      return 'The ID must be 14 number only';
    } else {
      return null;
    }
  }

  static String? isValidLicenseNumber(String? val) {
    final RegExp idRegex = RegExp(r'^\d{14}$');
    if (val == null || val.isEmpty) {
      return "This Field is required";
    } else if (!idRegex.hasMatch(val)) {
      return 'The License ID must be 14 number only';
    } else {
      return null;
    }
  }
}
