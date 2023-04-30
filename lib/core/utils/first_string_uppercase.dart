extension FirstStringUpperCase on String {
  String toUpperCaseFirstString() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
