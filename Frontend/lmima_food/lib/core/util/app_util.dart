class AppUtil {
  static String capitalizeFirstLetter(String input) {
    return input.isNotEmpty
        ? input[0].toUpperCase() + input.substring(1)
        : input;
  }

  static double remap(
      double value, double from1, double to1, double from2, double to2) {
    return (value - from1) / (to1 - from1) * (to2 - from2) + from2;
  }

  static bool isEmailValid(String email) {
    RegExp emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    // Check if password length is at least 8 characters
    if (password.length < 8) {
      return false;
    }

    // Check if password contains both letters and numbers
    bool containsLetters = RegExp(r'[a-zA-Z]').hasMatch(password);
    bool containsNumbers = RegExp(r'\d').hasMatch(password);

    return containsLetters && containsNumbers;
  }
}
