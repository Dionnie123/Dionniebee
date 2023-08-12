extension StringExtension on String {
  /// ensures that string has real value

  /// checks if the string is a valid url
  bool isValidUrl() {
    return Uri.parse(this).isAbsolute;
  }

  String toCapitalCase() {
    return isNotEmpty
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }

  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.toCapitalCase())
        .join(' ');
  }

  String clean() {
    return replaceAll(RegExp(r"\s+"), " ").trim();
  }
}
