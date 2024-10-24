// Example usage of validatorBuilder
String? validatorBuilder(List<String? Function()> validators) {
  for (var validator in validators) {
    var result = validator();
    if (result != null) {
      return result;
    }
  }
  return null;
}



