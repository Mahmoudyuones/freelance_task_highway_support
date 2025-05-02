class Validators {
  static String? isValidIDCardNumber(String? val) {
    final RegExp idRegex = RegExp(r'^\d{14}$');
    if (val == null || val.isEmpty) {
      return "This field is required";
    } else if (!idRegex.hasMatch(val)) {
      return 'The ID must be 14 digits only';
    } else {
      return null;
    }
  }

  static String? isValidLicenseNumber(String? val) {
    final RegExp idRegex = RegExp(r'^\d{14}$');
    if (val == null || val.isEmpty) {
      return "This field is required";
    } else if (!idRegex.hasMatch(val)) {
      return 'The License ID must be 14 digits only';
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (!usernameRegex.hasMatch(val)) {
      return 'Enter a valid username';
    } else {
      return null;
    }
  }

  static String? validateFirstName(String? val) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z\u0621-\u064A\s\-]{2,}$');
    if (val == null || val.trim().isEmpty) {
      return 'First name is required';
    } else if (!nameRegex.hasMatch(val)) {
      return 'Enter a valid first name';
    }
    return null;
  }

  static String? validateMiddleName(String? val) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z\u0621-\u064A\s\-]{2,}$');
    if (val == null || val.trim().isEmpty) {
      return 'Middle name is required';
    } else if (!nameRegex.hasMatch(val)) {
      return 'Enter a valid middle name';
    }
    return null;
  }

  static String? validateLastName(String? val) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z\u0621-\u064A\s\-]{2,}$');
    if (val == null || val.trim().isEmpty) {
      return 'Last name is required';
    } else if (!nameRegex.hasMatch(val)) {
      return 'Enter a valid last name';
    }
    return null;
  }

  static String? validateVehicleNumber(String? val) {
    if (val == null || val.isEmpty) {
      return "Vehicle Number Required";
    }
    return null;
  }

  static String? validateYear(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Year is required';
    }

    final int? year = int.tryParse(val);
    final int currentYear = DateTime.now().year;

    if (year == null) {
      return 'Enter a valid numeric year';
    } else if (year < 1900 || year > currentYear) {
      return 'Enter a year between 1900 and $currentYear ';
    }

    return null;
  }
}
