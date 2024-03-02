int verhoeffCompute(String value) {
  List<List<int>> d = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
    [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
    [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
    [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
    [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
    [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
    [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
    [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
    [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  ];

  List<int> p = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  int c = 0;

  for (int i = 0; i < value.length; i++) {
    int digit = int.parse(value[i]);
    c = d[c][p[digit]];
  }

  return p[c];
}

bool verhoeffValidate(String value) {
  int checkDigit = int.parse(value[value.length - 1]);
  String data = value.substring(0, value.length - 1);

  return verhoeffCompute(data) == checkDigit;
}

void main() {
  String originalData = "12345";
  
  // Add check digit
  String dataWithCheckDigit = originalData + verhoeffCompute(originalData).toString();
  print("Original Data with Check Digit: $dataWithCheckDigit");

  // Validate
  bool isValid = verhoeffValidate(dataWithCheckDigit);
  print("Is Valid: $isValid");
}
