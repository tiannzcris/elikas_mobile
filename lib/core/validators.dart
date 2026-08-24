/// Matches the backend's documented PH mobile number format:
/// 09XXXXXXXXX or +639XXXXXXXXX.
final RegExp phMobileNumber = RegExp(r'^(09\d{9}|\+639\d{9})$');

bool isValidPhMobileNumber(String value) => phMobileNumber.hasMatch(value.trim());
