String errorDefinition(String value) {
  final val = value.trim().toLowerCase();
  if (val.contains('already exists')) {
    return "User already exists.";
  }
  if (val.contains('invalid login credentials')) {
    return "Invalid login credentials.";
  }
  if (val.contains('confirm')) {
    return "Please verify your email address.Check your email.";
  }

  return value;
}
