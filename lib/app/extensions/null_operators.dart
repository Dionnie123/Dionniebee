extension IntOps on num? {
  num imul(num other) => this != null ? this! * other : 0;
  num iadd(num other) => this != null ? this! + other : 0;
  num isub(num other) => this != null ? this! - other : 0;
  // etc.
}
