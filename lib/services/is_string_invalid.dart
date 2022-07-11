bool isStringInvalid({required String text}) {
  bool isInvalid;
  if (text == "null" ||
      text == "" ||
      text == null ||
      text.isEmpty ||
      text == "notSet") {
    isInvalid = true;
  } else {
    isInvalid = false;
  }
  return isInvalid;
}
